<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="原材料名称" prop="materialsName">
        <el-input
          v-model="queryParams.materialsName"
          placeholder="请输入原材料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="原料数量" prop="materialsNum">
        <el-input
          v-model="queryParams.materialsNum"
          placeholder="请输入原料数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="价格" prop="materialsPrice">
        <el-input
          v-model="queryParams.materialsPrice"
          placeholder="请输入价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位" prop="unit">
        <el-input
          v-model="queryParams.unit"
          placeholder="请输入单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['materials:materials:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['materials:materials:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['materials:materials:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['materials:materials:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="materialsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="原料ID" align="center" prop="lpMaterialsId" />
      <el-table-column label="原材料名称" align="center" prop="materialsName" />
      <el-table-column label="原料数量" align="center" prop="materialsNum" />
      <el-table-column label="价格" align="center" prop="materialsPrice" />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="创建人" align="center" prop="createBy" />
      <el-table-column label="创建时间" align="center" prop="createTime" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleWarehouse(scope.row)"
            v-hasPermi="['materials:materials:warehouse']"
          >入库</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['materials:materials:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['materials:materials:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <el-dialog :title="title" :visible.sync="openWarehouse" width="960px" append-to-body>
      <el-form ref="form" :model="formWarehouse" :rules="rules" label-width="180px">
        <el-form-item label="数量" prop="materialsNum">
          <el-input v-model="formWarehouse.materialsNum"   placeholder="请输入数量" />
        </el-form-item>
          <el-form-item label="价格" prop="materialsPrice">
            <el-input v-model="formWarehouse.materialsPrice"   placeholder="请输入价格" />
          </el-form-item>

        <el-form-item label="单位" prop="unit">
          <el-input v-model="formWarehouse.unit"  placeholder="请输入单位" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitformWarehouse">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 添加或修改原料列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="原材料名称" prop="materialsName">
          <el-input v-model="form.materialsName" placeholder="请输入原材料名称" />
        </el-form-item>
        <el-form-item label="原料数量" prop="materialsNum">
          <el-input v-model="form.materialsNum" placeholder="请输入原料数量" />
        </el-form-item>
        <el-form-item label="价格" prop="materialsPrice">
          <el-input v-model="form.materialsPrice" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMaterials, getMaterials, delMaterials, addMaterials, updateMaterials,warehouseMaterials } from "../../..//api/materials/materials";

export default {
  name: "Materials",
  data() {
    return {
      openWarehouse:false,
      formWarehouse:{
        materialsName: ''
      },
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 原料列表表格数据
      materialsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        materialsName: null,
        materialsNum: null,
        materialsPrice: null,
        unit: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    submitformWarehouse(){
      warehouseMaterials(this.formWarehouse).then(response => {
        this.$modal.msgSuccess("入库操作成功");
        this.openWarehouse = false;
        this.getList();
      });
    },

    handleWarehouse(row){
      this.formWarehouse.materialsName = row.materialsName
      //this.formWarehouse.materialsPrice = row.materialsPrice
      this.openWarehouse = true
      this.title = '入库窗口'
    },

    /** 查询原料列表列表 */
    getList() {
      this.loading = true;
      listMaterials(this.queryParams).then(response => {
        this.materialsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        lpMaterialsId: null,
        materialsName: null,
        materialsNum: null,
        materialsPrice: null,
        unit: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.lpMaterialsId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加原料列表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const lpMaterialsId = row.lpMaterialsId || this.ids
      getMaterials(lpMaterialsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改原料列表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.lpMaterialsId != null) {
            updateMaterials(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMaterials(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const lpMaterialsIds = row.lpMaterialsId || this.ids;
      this.$modal.confirm('是否确认删除原料列表编号为"' + lpMaterialsIds + '"的数据项？').then(function() {
        return delMaterials(lpMaterialsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('materials/materials/export', {
        ...this.queryParams
      }, `materials_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
