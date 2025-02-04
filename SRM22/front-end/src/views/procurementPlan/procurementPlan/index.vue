<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="102px"
    >
      <el-form-item label="采购计划名称" prop="procurementPlanName">
        <el-input
          v-model="queryParams.procurementPlanName"
          placeholder="请输入采购计划名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数量" prop="procurementPlanNum">
        <el-input
          v-model="queryParams.procurementPlanNum"
          placeholder="请输入数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="价格" prop="procurementPlanPrice">
        <el-input
          v-model="queryParams.procurementPlanPrice"
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
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          v-hasPermi="['procurementPlan:procurementPlan:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['procurementPlan:procurementPlan:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['procurementPlan:procurementPlan:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['procurementPlan:procurementPlan:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="procurementPlanList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="procurementPlanId" />
      <!-- <el-table-column label="采购计划名称" align="center" prop="procurementPlanName" /> -->

      <el-table-column
        label="采购计划名称"
        align="center"
        prop="procurementPlanName"
      >
        <template slot-scope="scope">
          <router-link
            :to="
              '/procurementPlan-data/procurementPlan/' +
              scope.row.procurementPlanId
            "
            class="link-type"
          >
            <span> {{ scope.row.procurementPlanName }}</span>
          </router-link>
        </template>
      </el-table-column>

      <el-table-column label="数量" align="center" prop="procurementPlanNum" />
      <el-table-column
        label="价格"
        align="center"
        prop="procurementPlanPrice"
      />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column
        label="原材料分类ID"
        align="center"
        prop="materialsClassifyId"
      />
      <el-table-column label="供应商ID" align="center" prop="supplierId" />
      <el-table-column label="采购状态" align="center" prop="auditStatus">
        <template slot-scope="scope">
          <span v-if="scope.row.auditStatus === 0">
            <el-tag type="danger">未审核</el-tag>
          </span>
          <span v-if="scope.row.auditStatus === 1">
            <el-tag type="primary">审核</el-tag>
          </span>
          <span v-if="scope.row.auditStatus === 2">
            <el-tag type="success">审批</el-tag>
          </span>
        </template>
      </el-table-column>

      <el-table-column label="审核意见" align="center" prop="auditOpinion" />
      <el-table-column
        label="审核时间"
        align="center"
        prop="auditTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核人员" align="center" prop="auditPerson" />
      <el-table-column label="审批意见" align="center" prop="approverOpinion" />
      <el-table-column
        label="审批时间"
        align="center"
        prop="approverTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.approverTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审批人员" align="center" prop="approverPerson" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <span v-if="scope.row.auditStatus === 1">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-check"
              @click="handleApprover(scope.row)"
              v-hasPermi="['procurementPlan:procurementPlan:approver']"
              >审批</el-button
            >
          </span>
          <span v-if="scope.row.auditStatus === 0">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['procurementPlan:procurementPlan:edit']"
              >修改</el-button
            >
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['procurementPlan:procurementPlan:remove']"
              >删除</el-button
            >
            <el-button
              size="mini"
              type="text"
              icon="el-icon-circle-check"
              @click="handleAudit(scope.row)"
              v-hasPermi="['procurementPlan:procurementPlan:audit']"
              >审核</el-button
            >
          </span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 审批供应商对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openApprover"
      width="960px"
      append-to-body
    >
      <el-form
        ref="form"
        :model="formApprover"
        :rules="rules"
        label-width="180px"
      >
        <el-form-item label="审批状态" prop="auditStatus">
          <el-radio-group v-model="formApprover.auditStatus">
            <el-radio label="1">不通过</el-radio>
            <el-radio label="2">通过</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审批意见" prop="approverOpinion">
          <el-input
            v-model="formApprover.approverOpinion"
            type="textarea"
            placeholder="请输入意见内容"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormApprover">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--    //审核窗口-->
    <el-dialog
      :title="title"
      :visible.sync="openAudit"
      width="960px"
      append-to-body
    >
      <el-form ref="form" :model="formAudit" :rules="rules" label-width="180px">
        <el-form-item label="审核状态" prop="auditStatus">
          <el-radio-group v-model="formAudit.auditStatus">
            <el-radio label="0">不通过</el-radio>
            <el-radio label="1">通过</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核意见" prop="auditOpinion">
          <el-input
            v-model="formAudit.auditOpinion"
            type="textarea"
            placeholder="请输入意见内容"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormAudit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改采购计划对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-form-item label="采购计划名称" prop="procurementPlanName">
          <el-input
            v-model="form.procurementPlanName"
            placeholder="请输入采购计划名称"
          />
        </el-form-item>
        <el-form-item label="数量" prop="procurementPlanNum">
          <el-input
            v-model="form.procurementPlanNum"
            placeholder="请输入数量"
          />
        </el-form-item>
        <el-form-item label="价格" prop="procurementPlanPrice">
          <el-input
            v-model="form.procurementPlanPrice"
            placeholder="请输入价格"
          />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="原材料分类" prop="materialsClassifyId">
          <el-select
            v-model="form.materialsClassifyId"
            placeholder="请选择原材料分类"
          >
            <el-option
              v-for="item in materialsClassifyList"
              :key="item.materialsClassifyName"
              :label="item.materialsClassifyName"
              :value="item.materialsClassifyId"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="供应商" prop="supplierId">
          <el-select v-model="form.supplierId" placeholder="请选择供应商">
            <el-option
              v-for="item in supplierList"
              :key="item.supplierName"
              :label="item.supplierName"
              :value="item.supplierId"
            >
            </el-option>
          </el-select>
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
import {
  listProcurementPlan,
  getProcurementPlan,
  delProcurementPlan,
  addProcurementPlan,
  updateProcurementPlan,
  auditProcurementPlan,
  approverProcurementPlan,
} from "../../../api/procurementPlan/procurementPlan";
import { listMaterialsClassify } from "../../../api/materialsClassify/materialsClassify";
import { listSupplier } from "../../../api/supplier/supplier";

export default {
  name: "ProcurementPlan",
  data() {
    return {
      openApprover: false,
      formApprover: {
        procurementPlanId: 0,
      },
      openAudit: false,
      formAudit: {
        procurementPlanId: 0,
      },
      supplierList: [],

      materialsClassifyList: [],

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
      // 采购计划表格数据
      procurementPlanList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        procurementPlanName: null,
        procurementPlanNum: null,
        procurementPlanPrice: null,
        unit: null,
        materialsClassifyId: null,
        supplierId: null,
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
      rules: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    submitFormApprover() {
      approverProcurementPlan(this.formApprover).then((response) => {
        this.$modal.msgSuccess("审批操作成功");
        this.openApprover = false;
        this.getList();
      });
    },

    handleApprover(row) {
      this.formApprover.procurementPlanId = row.procurementPlanId;
      this.openApprover = true;
      this.title = "审批操作";
    },

    submitFormAudit() {
      auditProcurementPlan(this.formAudit).then((response) => {
        this.$modal.msgSuccess("审核操作成功");
        this.openAudit = false;
        this.getList();
      });
    },
    handleAudit(row) {
      this.formAudit.procurementPlanId = row.procurementPlanId;
      this.openAudit = true;
      this.title = "审核窗口";
    },
    supplierLists() {
      listSupplier(null).then((response) => {
        this.supplierList = response.rows;
      });
    },
    materialsClassifyLists() {
      listMaterialsClassify(null).then((response) => {
        this.materialsClassifyList = response.rows;
      });
    },

    /** 查询采购计划列表 */
    getList() {
      this.loading = true;
      listProcurementPlan(this.queryParams).then((response) => {
        this.procurementPlanList = response.rows;
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
        procurementPlanId: null,
        procurementPlanName: null,
        procurementPlanNum: null,
        procurementPlanPrice: null,
        unit: null,
        materialsClassifyId: null,
        supplierId: null,
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
        updateTime: null,
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
      this.ids = selection.map((item) => item.procurementPlanId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加采购计划";
      this.materialsClassifyLists();
      this.supplierLists();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const procurementPlanId = row.procurementPlanId || this.ids;
      getProcurementPlan(procurementPlanId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改采购计划";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.procurementPlanId != null) {
            updateProcurementPlan(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProcurementPlan(this.form).then((response) => {
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
      const procurementPlanIds = row.procurementPlanId || this.ids;
      this.$modal
        .confirm(
          '是否确认删除采购计划编号为"' + procurementPlanIds + '"的数据项？'
        )
        .then(function () {
          return delProcurementPlan(procurementPlanIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "procurementPlan/procurementPlan/export",
        {
          ...this.queryParams,
        },
        `procurementPlan_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
