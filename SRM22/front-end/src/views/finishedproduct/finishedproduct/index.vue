<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="成品名称" prop="finishedProductName">
        <el-input
          v-model="queryParams.finishedProductName"
          placeholder="请输入成品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成品数量" prop="finishedProductNum">
        <el-input
          v-model="queryParams.finishedProductNum"
          placeholder="请输入成品数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位" prop="finishedProductUnit">
        <el-input
          v-model="queryParams.finishedProductUnit"
          placeholder="请输入单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="带班人员" prop="firstDuty">
        <el-input
          v-model="queryParams.firstDuty"
          placeholder="请输入带班人员"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="firstDutyPhone">
        <el-input
          v-model="queryParams.firstDutyPhone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班次" prop="gradeClass">
        <el-input
          v-model="queryParams.gradeClass"
          placeholder="请输入班次"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上班时间" prop="officeTime">
        <el-input
          v-model="queryParams.officeTime"
          placeholder="请输入上班时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下班时间" prop="offTime">
        <el-input
          v-model="queryParams.offTime"
          placeholder="请输入下班时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上班人数" prop="officeNum">
        <el-input
          v-model="queryParams.officeNum"
          placeholder="请输入上班人数"
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
          v-hasPermi="['finishedproduct:finishedproduct:add']"
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
          v-hasPermi="['finishedproduct:finishedproduct:edit']"
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
          v-hasPermi="['finishedproduct:finishedproduct:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['finishedproduct:finishedproduct:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="finishedproductList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键递增" align="center" prop="finishedProductId" />
      <el-table-column label="成品名称" align="center" prop="finishedProductName" />
      <el-table-column label="成品数量" align="center" prop="finishedProductNum" />
      <el-table-column label="单位" align="center" prop="finishedProductUnit" />
      <el-table-column label="带班人员" align="center" prop="firstDuty" />
      <el-table-column label="联系电话" align="center" prop="firstDutyPhone" />
      <el-table-column label="班次" align="center" prop="gradeClass" />
      <el-table-column label="上班时间" align="center" prop="officeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.officeTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="下班时间" align="center" prop="offTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.offTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="上班人数" align="center" prop="officeNum" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['finishedproduct:finishedproduct:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['finishedproduct:finishedproduct:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleOperation(scope.row)"
            v-hasPermi="['finishedproduct:finishedproduct:operation']"
          >入库</el-button>

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

    <!-- 添加或修改成品列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="成品名称" prop="finishedProductName">
          <el-input v-model="form.finishedProductName" placeholder="请输入成品名称" />
        </el-form-item>
        <el-form-item label="成品数量" prop="finishedProductNum">
          <el-input v-model="form.finishedProductNum" placeholder="请输入成品数量" />
        </el-form-item>
        <el-form-item label="单位" prop="finishedProductUnit">
          <el-input v-model="form.finishedProductUnit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="带班人员" prop="firstDuty">
          <el-input v-model="form.firstDuty" placeholder="请输入带班人员" />
        </el-form-item>
        <el-form-item label="联系电话" prop="firstDutyPhone">
          <el-input v-model="form.firstDutyPhone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="班次" prop="gradeClass">
          <el-input v-model="form.gradeClass" placeholder="请输入班次" />
        </el-form-item>
        <el-form-item label="上班时间" prop="officeTime">
          <el-input v-model="form.officeTime" placeholder="请输入上班时间" />
        </el-form-item>
        <el-form-item label="下班时间" prop="offTime">
          <el-input v-model="form.offTime" placeholder="请输入下班时间" />
        </el-form-item>
        <el-form-item label="上班人数" prop="officeNum">
          <el-input v-model="form.officeNum" placeholder="请输入上班人数" />
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
import { listFinishedproduct, getFinishedproduct, delFinishedproduct, addFinishedproduct, updateFinishedproduct,operationFinishedProduct } from "@/api/finishedproduct/finishedproduct";

export default {
  name: "Finishedproduct",
  data() {
    return {
      operation:{
        finishedProductName:'',
        finishedProductNum:'',
        finishedProductUnit:'',
        firstDuty:'',
        firstDutyPhone:'',
        gradeClass:'',
        officeTime:'',
        offTime:'',
        officeNum:''
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
      // 成品列表表格数据
      finishedproductList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        finishedProductName: null,
        finishedProductNum: null,
        finishedProductUnit: null,
        firstDuty: null,
        firstDutyPhone: null,
        gradeClass: null,
        officeTime: null,
        offTime: null,
        officeNum: null,
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

    handleOperation(row){
      this.operation.finishedProductName = row.finishedProductName
      this.operation.finishedProductNum = row.finishedProductNum
      this.operation.finishedProductUnit = row.finishedProductUnit
      this.operation.firstDuty = row.firstDuty
      this.operation.firstDutyPhone = row.firstDutyPhone
      this.operation.gradeClass = row.gradeClass
      this.operation.officeNum = row.officeNum
      this.operation.officeTime = row.officeTime
      this.operation.offTime = row.offTime
      this.loading = true;
      operationFinishedProduct(this.operation).then(response => {
        this.$modal.msgSuccess("入库操作成功");
        this.getList();
        this.loading = false;
      });




    },
    /** 查询成品列表列表 */
    getList() {
      this.loading = true;
      listFinishedproduct(this.queryParams).then(response => {
        this.finishedproductList = response.rows;
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
        finishedProductId: null,
        finishedProductName: null,
        finishedProductNum: null,
        finishedProductUnit: null,
        firstDuty: null,
        firstDutyPhone: null,
        gradeClass: null,
        officeTime: null,
        offTime: null,
        officeNum: null,
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
      this.ids = selection.map(item => item.finishedProductId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加成品列表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const finishedProductId = row.finishedProductId || this.ids
      getFinishedproduct(finishedProductId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成品列表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.finishedProductId != null) {
            updateFinishedproduct(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFinishedproduct(this.form).then(response => {
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
      const finishedProductIds = row.finishedProductId || this.ids;
      this.$modal.confirm('是否确认删除成品列表编号为"' + finishedProductIds + '"的数据项？').then(function() {
        return delFinishedproduct(finishedProductIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('finishedproduct/finishedproduct/export', {
        ...this.queryParams
      }, `finishedproduct_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
