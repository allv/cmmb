package com.wootion.cimp.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import sun.net.TelnetInputStream;
import sun.net.TelnetOutputStream;
import sun.net.ftp.FtpClient;

public class FtpUtil {

	protected static final Log log = LogFactory.getLog(FtpUtil.class);

	/**
	 * connectServer 连接ftp服务器
	 * 
	 * @throws java.io.IOException
	 * @param path
	 *            文件夹，空代表根目录
	 * @param password
	 *            密码
	 * @param user
	 *            登陆用户
	 * @param serverIp
	 *            服务器地址
	 * @param port
	 *            端口号，默认为21
	 * @param path
	 *            FTP服务器上的路径
	 */
	FtpClient ftpClient;

	public void connectServer(String serverIp, int port, String user,
			String password, String path) throws IOException {

		ftpClient = new FtpClient();
		ftpClient.openServer(serverIp, port);
		ftpClient.login(user, password);
		// path是ftp服务下主目录的子目录
		if (path.length() > 3) {
			ftpClient.cd(path);
		}
		// 用2进制上传、下载
		ftpClient.binary();
	}

	/**
	 * upload 上传文件
	 * 
	 * @throws java.lang.Exception
	 * @return -1 文件不存在 -2 文件内容为空 >0 成功上传，返回文件的大小
	 * @param newname
	 *            上传后的新文件名
	 * @param filename
	 *            上传的文件
	 */
	public long upload(String filename, String newname) throws Exception {
		long result = 0;
		TelnetOutputStream os = null;
		FileInputStream is = null;
		try {
			java.io.File file_in = new java.io.File(filename);
			if (!file_in.exists()) {
				return -1;
			}
			if (file_in.length() == 0) {
				return -2;
			}
			os = ftpClient.put(newname);
			result = file_in.length();
			is = new FileInputStream(file_in);
			byte[] bytes = new byte[1024];
			int c;
			while ((c = is.read(bytes)) != -1) {
				os.write(bytes, 0, c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
			if (is != null) {
				is.close();
			}
			if (os != null) {
				os.close();
			}}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * upload
	 * 
	 * @throws java.lang.Exception
	 * @return
	 * @param filename
	 */
	public long upload(String filename) throws Exception {
		String newname = "";
		if (filename.indexOf("/") > -1) {
			newname = filename.substring(filename.lastIndexOf("/") + 1);
		} else {
			newname = filename;
		}
		return upload(filename, newname);
	}

	/**
	 * download 从ftp下载文件到本地
	 * 
	 * @throws java.lang.Exception
	 * @return
	 * @param newfilename
	 *            本地生成的文件名
	 * @param filename
	 *            服务器上的文件名
	 */
	public long download(String filename, String newfilename) throws Exception {
		long result = 0;
		TelnetInputStream is = null;
		FileOutputStream os = null;
		try {
			is = ftpClient.get(filename);
			java.io.File outfile = new java.io.File(newfilename);
			os = new FileOutputStream(outfile);
			byte[] bytes = new byte[1024];
			int c;
			while ((c = is.read(bytes)) != -1) {
				os.write(bytes, 0, c);
				result = result + c;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				is.close();
			}
			if (os != null) {
				os.close();
			}
		}
		return result;
	}

	/**
	 * download 从ftp下载文件到本地
	 * 
	 * @return
	 * @param remotePath
	 *            服务器上的文件目录
	 * @param remoteFile
	 *            服务器上的文件名
	 * @param localPath
	 *            本地生成的文件目录
	 * @param localFile
	 *            本地生成的文件名
	 */
	public String download(String remotePath, String remoteFile,
			String localPath, String localFile) throws Exception {
		// System.out.println("==================="+this.getId() +
		// this.getName()+"开始下载=====================");
		TelnetInputStream is = null;
		FileOutputStream os = null;
		String flag = "0";
		try {
			is = ftpClient.get(remotePath + remoteFile);
			java.io.File file_in = new java.io.File(localPath + localFile);
			os = new FileOutputStream(file_in);
			byte[] bytes = new byte[1024];
			int c;
			while ((c = is.read(bytes)) != -1) {
				// System.out.println((char)is.read());
				// System.out.println(file_in);
				os.write(bytes, 0, c);
			}

			// System.out.println("下载成功！");
			flag = "1";
		} catch (IOException ex) {
			// System.out.println("没有下载！");
			flag = "0";
			// ex.printStackTrace();
		} finally {
			if (is != null) {
				is.close();
			}
			if (os != null) {
				os.close();
			}
		}
		// System.out.println("==================="+this.getId() +
		// this.getName()+"下载结束=====================");
		return flag;
	}

	/**
	 * 取得某个目录下的所有文件列表
	 * 
	 */
	@SuppressWarnings( { "unchecked", "deprecation" })
	public List getFileList(String path) {
		List list = new ArrayList();
		try {
			DataInputStream dis = new DataInputStream(ftpClient.nameList(path));
			String filename = "";
			while ((filename = dis.readLine()) != null) {
				list.add(filename);
			}

		} catch (Exception e) {
			// System.out.println("没有找到ftp上的文件夹 或 无文件！");
			// e.printStackTrace();
		}
		return list;
	}

	/**
	 * closeServer 断开与ftp服务器的链接
	 * 
	 * @throws java.io.IOException
	 */
	public void closeServer()  {
		try {
			if (ftpClient != null) {
				ftpClient.closeServer();
				// System.out.println("退出FTP！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 判断本地是否存在文件夹路径，如果不存在，则创建
	 * 
	 */
	public boolean creatLocalFolder(String path) {
		File dirFile;
		boolean bFile;
		bFile = false;
		File fdir = new File(File.separator);
		dirFile = new File(fdir, path);
		bFile = dirFile.exists();

		if (bFile == true) {
			// log.info(path+"文件夹已存在！");
		} else {
			// log.info(path+"文件夹不存在，开始创建...");
			try {
				bFile = dirFile.mkdirs();// bFile = dirFile.mkdirs();//可创建多个
			} catch (Exception e) {
				e.printStackTrace();
				bFile = false;
				// log.info("本地文件夹检测失败！");
			}
			if (bFile == true) {
				// log.info("本地文件夹创建成功1！");
			} else {
				// log.info("本地文件夹创建失败2！");
			}
		}

		return bFile;
	}

	/**
	 * 删除指定ftp上的文件
	 * 
	 */
	public String delete(String remotePath, String fileName) {
		String remoteFile = "dele " + remotePath + fileName + "\r\n";
		String flag = "0";
		try {
			ftpClient.sendServer(remoteFile); // 删除服务器上的文件
			ftpClient.readServerResponse();// 相应时间
			flag = "1";
		} catch (Exception e) {
			e.printStackTrace();
			flag = "0";
		}
		return flag;
	}

	// 遍历本地指定文件夹
	@SuppressWarnings("unchecked")
	public List getAllFiles(String absoluteDir) {
		// 存放所有文件绝对路径名的list
		List<String> files = new ArrayList();
		// 当前目录的file实例
		File fdir = new File(File.separator);
		File parentDir = new File(fdir, absoluteDir);
		// 列举当前目录下的所有文件和目录的名字
		String[] list = parentDir.list();
		for (String s : list) {
			// 绝对路径名
			String name = absoluteDir + "/" + s;
			File instance = new File(name);
			// 如果是文件则添加到list
			if (instance.isFile()) {
				files.add(name);
				// 如果是目录则使用递归
			} else {
				files.addAll(getAllFiles(name));
			}
		}
		return files;
	}

	// 删除指定本地文件
	public boolean delFile(String fileName) {
		boolean flag = false;
		flag = (new File(fileName)).delete();
		return flag;
	}

	/**
	 * 读取本地txt数据
	 */
	public String ReadData(String fileName) {
		BufferedReader br = null;
		String buf = "";
		try {
			FileReader read = new FileReader(fileName);
			br = new BufferedReader(read);
			String row;
			while ((row = br.readLine()) != null) {
				buf = row;
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buf;
	}

	/**
	 * 解析database.properties，获取数据库配置
	 */
	public String[] getDataBaseConf() {
		String[] ftpConf = new String[6];

		try {
			Properties properties = new Properties();
			// System.out.println("*******"+getClass().getClassLoader().getResource(""));
			// InputStream is = new
			// FileInputStream("./configs/database.properties");//解析ftpconfig.properties
			InputStream is = getClass().getClassLoader().getResourceAsStream(
					"configs/database.properties");
			properties.load(is);
			is.close();

			ftpConf[0] = "jdbc:oracle:thin:@"
					+ properties.getProperty("database");
			ftpConf[1] = properties.getProperty("username");
			ftpConf[2] = properties.getProperty("password");

		} catch (FileNotFoundException ex) {
			log.error(ex);
		} catch (IOException ex) {
			log.error(ex);
		}

		return ftpConf;
	}

	/**
	 * 解析time.properties，获取数据库配置
	 */
	public String[] getTimeConf() {
		String[] ftpConf = new String[6];

		try {
			Properties properties = new Properties();

			InputStream is = getClass().getClassLoader().getResourceAsStream(
					"configs/time.properties");
			properties.load(is);
			is.close();

			ftpConf[0] = properties.getProperty("yan_chi");
			ftpConf[1] = properties.getProperty("jian_ge");
		} catch (FileNotFoundException ex) {
			log.error(ex);
		} catch (IOException ex) {
			log.error(ex);
		}

		return ftpConf;
	}

}
