import request from '@/utils/request'

// 查询原料列表列表
export function listMaterials(query) {
  return request({
    url: '/materials/materials/list',
    method: 'get',
    params: query
  })
}

// 查询原料列表详细
export function getMaterials(lpMaterialsId) {
  return request({
    url: '/materials/materials/' + lpMaterialsId,
    method: 'get'
  })
}

// 新增原料列表
export function addMaterials(data) {
  return request({
    url: '/materials/materials',
    method: 'post',
    data: data
  })
}



// 入库原料
export function warehouseMaterials(data) {
  return request({
    url: '/materials/materials/warehouse',
    method: 'put',
    data: data
  })
}

// 修改原料列表
export function updateMaterials(data) {
  return request({
    url: '/materials/materials',
    method: 'put',
    data: data
  })
}

// 删除原料列表
export function delMaterials(lpMaterialsId) {
  return request({
    url: '/materials/materials/' + lpMaterialsId,
    method: 'delete'
  })
}
