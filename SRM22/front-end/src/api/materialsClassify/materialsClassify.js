import request from '@/utils/request'

// 查询原材料分类列表
export function listMaterialsClassify(query) {
  return request({
    url: '/materialsClassify/materialsClassify/list',
    method: 'get',
    params: query
  })
}

// 查询原材料分类详细
export function getMaterialsClassify(materialsClassifyId) {
  return request({
    url: '/materialsClassify/materialsClassify/' + materialsClassifyId,
    method: 'get'
  })
}

// 新增原材料分类
export function addMaterialsClassify(data) {
  return request({
    url: '/materialsClassify/materialsClassify',
    method: 'post',
    data: data
  })
}

// 修改原材料分类
export function updateMaterialsClassify(data) {
  return request({
    url: '/materialsClassify/materialsClassify',
    method: 'put',
    data: data
  })
}

// 删除原材料分类
export function delMaterialsClassify(materialsClassifyId) {
  return request({
    url: '/materialsClassify/materialsClassify/' + materialsClassifyId,
    method: 'delete'
  })
}
