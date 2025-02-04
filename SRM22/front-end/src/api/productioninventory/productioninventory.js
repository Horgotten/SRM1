import request from '@/utils/request'

// 查询生产耗材列表
export function listProductioninventory(query) {
  return request({
    url: '/productioninventory/productioninventory/list',
    method: 'get',
    params: query
  })
}

// 查询生产耗材详细
export function getProductioninventory(productionInventoryId) {
  return request({
    url: '/productioninventory/productioninventory/' + productionInventoryId,
    method: 'get'
  })
}

// 新增生产耗材
export function addProductioninventory(data) {
  return request({
    url: '/productioninventory/productioninventory',
    method: 'post',
    data: data
  })
}



// 审批生产耗材
export function approverProductionInventory(data) {
  return request({
    url: '/productioninventory/productioninventory/approver',
    method: 'put',
    data: data
  })
}

// 审核生产耗材
export function auditProductionInventory(data) {
  return request({
    url: '/productioninventory/productioninventory/audit',
    method: 'put',
    data: data
  })
}

// 修改生产耗材
export function updateProductioninventory(data) {
  return request({
    url: '/productioninventory/productioninventory',
    method: 'put',
    data: data
  })
}

// 删除生产耗材
export function delProductioninventory(productionInventoryId) {
  return request({
    url: '/productioninventory/productioninventory/' + productionInventoryId,
    method: 'delete'
  })
}
