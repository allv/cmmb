package com.wootion.idp.common.listener;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.utils.DataInit;
import com.wootion.idp.persistence.po.bean.Wtfunction;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtresource;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtrolefunrelationship;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.function.FunctionManagerService;
import com.wootion.idp.service.resource.ResourceManagerService;
import com.wootion.idp.service.role.RoleManagerService;
import java.util.List;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class PermissionListener
  implements ServletContextListener
{
  public void contextDestroyed(ServletContextEvent arg0)
  {
  }

  public void contextInitialized(ServletContextEvent event)
  {
    String basePath = event.getServletContext().getRealPath("/");
    DataInit.initData(basePath);
    ResourceManagerService resService = ServiceFactroy.getResoureService();
    List lstPer = resService.getAllObject(Wtresource.class);
    for (int i = 0; i < lstPer.size(); ++i) {
      Wtresource res = (Wtresource)lstPer.get(i);
      PermissionCollection.getInstance().addFunctionResource(
        res.getWtfunction().getWtfunctionId(), res);
    }

    List lstPerC = resService
      .getAllObject(Wtpermission.class);
    for (int i = 0; i < lstPerC.size(); ++i) {
      Wtpermission per = (Wtpermission)lstPerC.get(i);
      Wtrole role = per.getWtrole();
      Wtresource res = per.getWtresource();
      PermissionCollection.getInstance().addRRole(res.getWtresourceId(), 
        role);
    }

    RoleManagerService roleService = ServiceFactroy.getRoleService();
    List lstRF = roleService
      .getAllObject(Wtrolefunrelationship.class);
    for (int i = 0; i < lstRF.size(); ++i) {
      Wtrolefunrelationship role = (Wtrolefunrelationship)lstRF.get(i);
      PermissionCollection.getInstance().addFunctionRole(
        role.getWtfunction().getWtfunctionId(), 
        role.getWtrole().getWtroleId());
    }

    FunctionManagerService functionService = 
      ServiceFactroy.getFunctionService();
    List lstFunc = functionService.getFunctions();
    for (int i = 0; i < lstFunc.size(); ++i) {
      Wtfunction fun = (Wtfunction)lstFunc.get(i);
      if (fun.getWtfunIsleaf().equals("0")) {
        if (fun.getWtfunctionId().equals(Long.valueOf(0L)))
          continue;
        PermissionCollection.getInstance().addFirstFunction(fun);
      }
      else
      {
        PermissionCollection.getInstance().addFSecFun(
          fun.getWtfunParentid(), fun);
      }
    }
  }
}