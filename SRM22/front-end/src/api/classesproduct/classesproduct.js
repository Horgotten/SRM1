import request from '@/utils/request'

// 查询成品分类列表
export function listClassesproduct(query) {
  return request({
    url: '/classesproduct/classesproduct/list',
    method: 'get',
    params: query
  })
}

// 查询成品分类详细
export function getClassesproduct(classesProductId) {
  return request({
    url: '/classesproduct/classesproduct/' + classesProductId,
    method: 'get'
  })
}

// 新增成品分类
export function addClassesproduct(data) {
  return request({
    url: '/classesproduct/classesproduct',
    method: 'post',
    data: data
  })
}

// 修改成品分类
export function updateClassesproduct(data) {
  return request({
    url: '/classesproduct/classesproduct',
    method: 'put',
    data: data
  })
}

// 删除成品分类
export function delClassesproduct(classesProductId) {
  return request({
    url: '/classesproduct/classesproduct/' + classesProductId,
    method: 'delete'
  })
}
