<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="库存名称" prop="inventoryName">
        <el-input
          v-model="queryParams.inventoryName"
          placeholder="请输入库存名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数量" prop="inventoryNum">
        <el-input
          v-model="queryParams.inventoryNum"
          placeholder="请输入数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="价格" prop="inventoryPrice">
        <el-input
          v-model="queryParams.inventoryPrice"
          placeholder="请输入价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位" prop="inventoryUnit">
        <el-input
          v-model="queryParams.inventoryUnit"
          placeholder="请输入单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库列表ID" prop="warehouseWarrantId">
        <el-input
          v-model="queryParams.warehouseWarrantId"
          placeholder="请输入入库列表ID"
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
          v-hasPermi="['inventory:inventory:add']"
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
          v-hasPermi="['inventory:inventory:edit']"
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
          v-hasPermi="['inventory:inventory:remove']"
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
          v-hasPermi="['inventory:inventory:export']"
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
      :data="inventoryList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="inventoryId" />
      <el-table-column label="库存名称" align="center" prop="inventoryName" />
      <el-table-column label="数量" align="center" prop="inventoryNum" />
      <el-table-column label="价格" align="center" prop="inventoryPrice" />
      <el-table-column label="单位" align="center" prop="inventoryUnit" />
      <el-table-column
        label="入库列表ID"
        align="center"
        prop="warehouseWarrantId"
      />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['inventory:inventory:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['inventory:inventory:remove']"
            >删除</el-button
          >

          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handlePull(scope.row)"
            v-hasPermi="['inventory:inventory:pull']"
            >申领</el-button
          >
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

    <el-dialog
      :title="title"
      :visible.sync="openPull"
      width="500px"
      append-to-body
    >
      <el-form ref="form" :model="formPull" :rules="rules" label-width="102px">
        <el-form-item label="数量" prop="inventoryNum">
          <el-input v-model="formPull.inventoryNum" placeholder="请输入数量" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormPull">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改库存列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库存名称" prop="inventoryName">
          <el-input v-model="form.inventoryName" placeholder="请输入库存名称" />
        </el-form-item>
        <el-form-item label="数量" prop="inventoryNum">
          <el-input v-model="form.inventoryNum" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="价格" prop="inventoryPrice">
          <el-input v-model="form.inventoryPrice" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="单位" prop="inventoryUnit">
          <el-input v-model="form.inventoryUnit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="入库列表ID" prop="warehouseWarrantId">
          <el-input
            v-model="form.warehouseWarrantId"
            placeholder="请输入入库列表ID"
          />
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
  listInventory,
  getInventory,
  delInventory,
  addInventory,
  updateInventory,
  pullInventory,
} from "@/api/inventory/inventory";

export default {
  name: "Inventory",
  data() {
    return {
      openPull: false,
      formPull: {
        inventoryId: 0,
        inventoryName: "",
        inventoryUnit: "",
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
      // 库存列表表格数据
      inventoryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        inventoryName: null,
        inventoryNum: null,
        inventoryPrice: null,
        inventoryUnit: null,
        warehouseWarrantId: null,
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
    //申领提交数据
    submitFormPull() {
      pullInventory(this.formPull).then((response) => {
        this.$modal.msgSuccess("申请成功");
        this.openPull = false;
        this.getList();
      });
    },

    //申领窗口方法
    handlePull(row) {
      this.formPull.inventoryId = row.inventoryId;
      this.formPull.inventoryName = row.inventoryName;
      this.formPull.inventoryUnit = row.inventoryUnit;

      this.openPull = true;
      this.title = "申领窗口";
    },

    /** 查询库存列表列表 */
    getList() {
      this.loading = true;
      listInventory(this.queryParams).then((response) => {
        this.inventoryList = response.rows;
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
        inventoryId: null,
        inventoryName: null,
        inventoryNum: null,
        inventoryPrice: null,
        inventoryUnit: null,
        warehouseWarrantId: null,
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
      this.ids = selection.map((item) => item.inventoryId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加库存列表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const inventoryId = row.inventoryId || this.ids;
      getInventory(inventoryId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改库存列表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.inventoryId != null) {
            updateInventory(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInventory(this.form).then((response) => {
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
      const inventoryIds = row.inventoryId || this.ids;
      this.$modal
        .confirm('是否确认删除库存列表编号为"' + inventoryIds + '"的数据项？')
        .then(function () {
          return delInventory(inventoryIds);
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
        "inventory/inventory/export",
        {
          ...this.queryParams,
        },
        `inventory_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>

