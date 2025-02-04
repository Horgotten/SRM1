import request from '@/utils/request'

// 查询成品列表列表
export function listFinishedproduct(query) {
  return request({
    url: '/finishedproduct/finishedproduct/list',
    method: 'get',
    params: query
  })
}

// 查询成品列表详细
export function getFinishedproduct(finishedProductId) {
  return request({
    url: '/finishedproduct/finishedproduct/' + finishedProductId,
    method: 'get'
  })
}


// 入库成品列表
export function operationFinishedProduct(data) {
  return request({
    url: '/finishedproduct/finishedproduct/operation',
    method: 'post',
    data: data
  })
}

// 新增成品列表
export function addFinishedproduct(data) {
  return request({
    url: '/finishedproduct/finishedproduct',
    method: 'post',
    data: data
  })
}

// 修改成品列表
export function updateFinishedproduct(data) {
  return request({
    url: '/finishedproduct/finishedproduct',
    method: 'put',
    data: data
  })
}

// 删除成品列表
export function delFinishedproduct(finishedProductId) {
  return request({
    url: '/finishedproduct/finishedproduct/' + finishedProductId,
    method: 'delete'
  })
}
