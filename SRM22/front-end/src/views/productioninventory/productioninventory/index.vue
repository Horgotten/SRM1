<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="原料名称" prop="productionInventoryName">
        <el-input
          v-model="queryParams.productionInventoryName"
          placeholder="请输入原料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成品名称" prop="finishedProductName">
        <el-input
          v-model="queryParams.finishedProductName"
          placeholder="请输入成品名称"
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
        <el-date-picker clearable
                        v-model="queryParams.officeTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择上班时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="下班时间" prop="offTime">
        <el-date-picker clearable
                        v-model="queryParams.offTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择下班时间">
        </el-date-picker>
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
          v-hasPermi="['productioninventory:productioninventory:add']"
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
          v-hasPermi="['productioninventory:productioninventory:edit']"
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
          v-hasPermi="['productioninventory:productioninventory:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['productioninventory:productioninventory:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="productioninventoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="原料名称" align="center" prop="productionInventoryName" />
      <el-table-column label="原料数量" align="center" prop="productionInventoryNum" />
      <el-table-column label="单位" align="center" prop="productionInventoryUnit" />
      <el-table-column label="成品名称" align="center" prop="finishedProductName" />
      <el-table-column label="成品数量" align="center" prop="finishedProductNum" />
      <el-table-column label="成品单位" align="center" prop="finishedProductUnit" />
      <el-table-column label="损耗名称" align="center" prop="lossName" />
      <el-table-column label="损耗数量" align="center" prop="lossNum" />
      <el-table-column label="损耗单位" align="center" prop="lossUnit" />
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
      <el-table-column label="审核状态" align="center" prop="auditStatus" >
        <template slot-scope="scope">
          <span v-if="scope.row.auditStatus ===0">
             <el-tag  type="danger">未审核</el-tag>
          </span>
          <span v-if="scope.row.auditStatus ===1">
            <el-tag type="primary">审核</el-tag>
          </span>
          <span v-if="scope.row.auditStatus ===2">
            <el-tag   type="success">审批</el-tag>
          </span>
        </template>
      </el-table-column>
      <el-table-column label="审核意见" align="center" prop="auditOpinion" />
      <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核人" align="center" prop="auditPerson" />
      <el-table-column label="审批意见" align="center" prop="approverOpinion" />
      <el-table-column label="审批时间" align="center" prop="approverTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.approverTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审批人" align="center" prop="approverPerson" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.auditStatus === 1">
             <el-button
               size="mini"
               type="text"
               icon="el-icon-delete"
               @click="handleApprover(scope.row)"
               v-hasPermi="['productioninventory:productioninventory:approver']"
             >审核</el-button>
          </span>
          <span v-if="scope.row.auditStatus === 0">
             <el-button
               size="mini"
               type="text"
               icon="el-icon-edit"
               @click="handleUpdate(scope.row)"
               v-hasPermi="['productioninventory:productioninventory:edit']"
             >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['productioninventory:productioninventory:remove']"
          >删除</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleAudit(scope.row)"
              v-hasPermi="['productioninventory:productioninventory:audit']"
            >审核</el-button>
          </span>

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

    <!-- 审批 -->
    <el-dialog :title="title" :visible.sync="openApprover" width="960px" append-to-body>
      <el-form ref="form" :model="formApprover" :rules="rules" label-width="180px">
        <el-form-item label="审批状态" prop="auditStatus">
          <el-radio-group v-model="formApprover.auditStatus">
            <el-radio label="1">不通过</el-radio>
            <el-radio label="2">通过</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审批意见" prop="approverOpinion">
          <el-input v-model="formApprover.approverOpinion" type="textarea" placeholder="请输入意见内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormApprover">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--    //审核窗口-->
    <el-dialog :title="title" :visible.sync="openAudit" width="960px" append-to-body>
      <el-form ref="form" :model="formAudit" :rules="rules" label-width="180px">
        <el-form-item label="审核状态" prop="auditStatus">
          <el-radio-group v-model="formAudit.auditStatus">
            <el-radio label="0">不通过</el-radio>
            <el-radio label="1">通过</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核意见" prop="auditOpinion">
          <el-input v-model="formAudit.auditOpinion" type="textarea" placeholder="请输入意见内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormAudit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改生产耗材对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-form-item label="成品名称" prop="finishedProductName">
          <el-input v-model="form.finishedProductName" placeholder="请输入成品名称" />
        </el-form-item>
        <el-form-item label="成品数量" prop="finishedProductNum">
          <el-input v-model="form.finishedProductNum" placeholder="请输入成品数量" />
        </el-form-item>
        <el-form-item label="成品单位" prop="finishedProductUnit">
          <el-input v-model="form.finishedProductUnit" placeholder="请输入成品单位" />
        </el-form-item>
        <el-form-item label="损耗名称" prop="lossName">
          <el-input v-model="form.lossName" placeholder="请输入损耗名称" />
        </el-form-item>
        <el-form-item label="损耗数量" prop="lossNum">
          <el-input v-model="form.lossNum" placeholder="请输入损耗数量" />
        </el-form-item>
        <el-form-item label="损耗单位" prop="lossUnit">
          <el-input v-model="form.lossUnit" placeholder="请输入损耗单位" />
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
          <div class="block">
            <span class="demonstration"></span>
            <el-date-picker
              v-model="form.officeTime"
              type="datetime"
              placeholder="选择日期时间">
            </el-date-picker>
          </div>
        </el-form-item>
        <el-form-item label="下班时间" prop="offTime">
          <div class="block">
            <span class="demonstration"></span>
            <el-date-picker
              v-model="form.offTime"
              type="datetime"
              placeholder="选择日期时间">
            </el-date-picker>
          </div>
        </el-form-item>
        <el-form-item label="上班人数" prop="officeNum">
          <el-input v-model="form.officeNum" placeholder="请输入上班人数" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listProductioninventory, getProductioninventory, delProductioninventory, addProductioninventory, updateProductioninventory,auditProductionInventory,approverProductionInventory } from "@/api/productioninventory/productioninventory";

export default {
  name: "Productioninventory",
  data() {
    return {
      openApprover:false,
      formApprover:{
        productionInventoryId:0
      },
      openAudit:false,
      formAudit:{
        productionInventoryId:0
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
      // 生产耗材表格数据
      productioninventoryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productionInventoryName: null,
        productionInventoryNum: null,
        productionInventoryPrice: null,
        productionInventoryUnit: null,
        finishedProductName: null,
        finishedProductNum: null,
        finishedProductUnit: null,
        lossName: null,
        lossNum: null,
        lossUnit: null,
        firstDuty: null,
        firstDutyPhone: null,
        gradeClass: null,
        officeTime: null,
        offTime: null,
        officeNum: null,
        auditStatus: null,
        auditOpinion: null,
        auditTime: null,
        auditPerson: null,
        approverOpinion: null,
        approverTime: null,
        approverPerson: null,
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
    //审批提交数据
    submitFormApprover(){
      approverProductionInventory(this.formApprover).then(response => {
        this.$modal.msgSuccess("审批操作成功");
        this.openApprover = false;
        this.getList();
      });
    },
    //审批窗口
    handleApprover(row){
      this.formApprover.productionInventoryId = row.productionInventoryId
      this.openApprover = true
      this.title = '审批窗口'
    },
    //审核提交数据
    submitFormAudit(){
      auditProductionInventory(this.formAudit).then(response => {
        this.$modal.msgSuccess("审核操作成功");
        this.openAudit = false;
        this.getList();
      });
    },
    //审核打开窗口
    handleAudit(row){
      this.formAudit.productionInventoryId = row.productionInventoryId
      this.openAudit = true
      this.title = '审核窗口'
    },
    /** 查询生产耗材列表 */
    getList() {
      this.loading = true;
      listProductioninventory(this.queryParams).then(response => {
        this.productioninventoryList = response.rows;
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
        productionInventoryId: null,
        productionInventoryName: null,
        productionInventoryNum: null,
        productionInventoryPrice: null,
        productionInventoryUnit: null,
        finishedProductName: null,
        finishedProductNum: null,
        finishedProductUnit: null,
        lossName: null,
        lossNum: null,
        lossUnit: null,
        firstDuty: null,
        firstDutyPhone: null,
        gradeClass: null,
        officeTime: null,
        offTime: null,
        officeNum: null,
        auditStatus: 0,
        auditOpinion: null,
        auditTime: null,
        auditPerson: null,
        approverOpinion: null,
        approverTime: null,
        approverPerson: null,
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
      this.ids = selection.map(item => item.productionInventoryId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加生产耗材";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const productionInventoryId = row.productionInventoryId || this.ids
      getProductioninventory(productionInventoryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改生产耗材";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.productionInventoryId != null) {
            updateProductioninventory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProductioninventory(this.form).then(response => {
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
      const productionInventoryIds = row.productionInventoryId || this.ids;
      this.$modal.confirm('是否确认删除生产耗材编号为"' + productionInventoryIds + '"的数据项？').then(function() {
        return delProductioninventory(productionInventoryIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('productioninventory/productioninventory/export', {
        ...this.queryParams
      }, `productioninventory_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

