<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="入库名称" prop="warehouseWarrantName">
        <el-input
          v-model="queryParams.warehouseWarrantName"
          placeholder="请输入入库名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="入库价格" prop="warehouseWarrantPrice">
        <el-input
          v-model="queryParams.warehouseWarrantPrice"
          placeholder="请输入入库价格"
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
          v-hasPermi="['warehouseWarrant:warehouseWarrant:add']"
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
          v-hasPermi="['warehouseWarrant:warehouseWarrant:edit']"
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
          v-hasPermi="['warehouseWarrant:warehouseWarrant:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['warehouseWarrant:warehouseWarrant:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="warehouseWarrantList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="入库名称" align="center" prop="warehouseWarrantName" />
      <el-table-column label="入库数量" align="center" prop="warehouseWarrantNum" />
      <el-table-column label="入库价格" align="center" prop="warehouseWarrantPrice" />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column label="库房ID" align="center" prop="warehouseId" />
      <el-table-column label="货架ID" align="center" prop="shelfId" />
      <el-table-column label="库位ID" align="center" prop="locationId" />
      <el-table-column label="采购状态" align="center" prop="auditStatus" >
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
      <el-table-column label="审核人员" align="center" prop="auditPerson" />
      <el-table-column label="审批意见" align="center" prop="approverOpinion" />
      <el-table-column label="审批时间" align="center" prop="approverTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.approverTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审批人员" align="center" prop="approverPerson" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.auditStatus === 1">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleApprover(scope.row)"
              v-hasPermi="['warehouseWarrant:warehouseWarrant:approver']"
            >审批</el-button>
          </span>
          <span v-if="scope.row.auditStatus === 0">

            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleWarehouse(scope.row)"
              v-hasPermi="['warehouseWarrant:warehouseWarrant:warehouse']"
            >选择</el-button>
             <el-button
               size="mini"
               type="text"
               icon="el-icon-edit"
               @click="handleUpdate(scope.row)"
               v-hasPermi="['warehouseWarrant:warehouseWarrant:edit']"
             >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['warehouseWarrant:warehouseWarrant:remove']"
          >删除</el-button>

             <el-button
               size="mini"
               type="text"
               icon="el-icon-delete"
               @click="handleAudit(scope.row)"
               v-hasPermi="['warehouseWarrant:warehouseWarrant:audit']"
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
<!--    审批窗口-->
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



    <!--    //选择窗口-->
    <el-dialog :title="title" :visible.sync="openWarehouse" width="960px" append-to-body>

      <el-form ref="form" :model="formWarehouse" :rules="rules" label-width="180px">
        <el-form-item label="选择库房">
          <el-select v-model="formWarehouse.warehouseId"  placeholder="请选择库房">
            <el-option v-for="item in warehouseList"
                       :key="item.warehouseName"
                       :label="item.warehouseName"
                       :value="item.warehouseId"
            >
            </el-option>
          </el-select>
        </el-form-item>
          <el-form-item label="选择货架">
            <el-select v-model="formWarehouse.shelfId"  placeholder="请选择货架">
              <el-option v-for="item in shelfList"
                         :key="item.shelfName"
                         :label="item.shelfName"
                         :value="item.shelfId"
              >
              </el-option>
            </el-select>
          </el-form-item>
        <el-form-item label="选择货位">
          <el-select v-model="formWarehouse.locationId"  placeholder="请选择货位">
            <el-option v-for="item in locationList"
                       :key="item.locationName"
                       :label="item.locationName"
                       :value="item.locationId"
            >
            </el-option>
          </el-select>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormWarehouse">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改入库列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-form-item label="入库名称" prop="warehouseWarrantName">
          <el-input v-model="form.warehouseWarrantName" placeholder="请输入入库名称" />
        </el-form-item>
        <el-form-item label="入库数量" prop="warehouseWarrantNum">
          <el-input v-model="form.warehouseWarrantNum" placeholder="请输入入库数量" />
        </el-form-item>
        <el-form-item label="入库价格" prop="warehouseWarrantPrice">
          <el-input v-model="form.warehouseWarrantPrice" placeholder="请输入入库价格" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="库房ID" prop="warehouseId">
          <el-input v-model="form.warehouseId" placeholder="请输入库房ID" />
        </el-form-item>
        <el-form-item label="货架ID" prop="shelfId">
          <el-input v-model="form.shelfId" placeholder="请输入货架ID" />
        </el-form-item>
        <el-form-item label="库位ID" prop="locationId">
          <el-input v-model="form.locationId" placeholder="请输入库位ID" />
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
import { listWarehouseWarrant, getWarehouseWarrant, delWarehouseWarrant, addWarehouseWarrant, updateWarehouseWarrant,warehouseUpdateWarehouseWarrant,auditWarehouseWarrant,approverWarehouseWarrant } from "@/api/warehouseWarrant/warehouseWarrant";
import {listWarehouse} from "../../../api/warehouse/warehouse";
import {listShelf} from "../../../api/shelf/shelf";
import {listLocation} from "../../../api/location/location";

export default {
  name: "WarehouseWarrant",
  data() {
    return {
      openApprover:false,
      formApprover:{
        warehouseWarrantId: 0
      },

      openAudit:false,
      formAudit:{
        warehouseWarrantId: 0
      },
      openWarehouse:false,
      locationList:[],
      shelfList:[],
      warehouseList:[],
      formWarehouse:{
        warehouseWarrantId: 0
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
      // 入库列表表格数据
      warehouseWarrantList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        warehouseWarrantName: null,
        warehouseWarrantNum: null,
        warehouseWarrantPrice: null,
        unit: null,
        warehouseId: null,
        shelfId: null,
        locationId: null,
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

    //审批窗口打开方法
    handleApprover(row){
      this.formApprover.warehouseWarrantId = row.warehouseWarrantId
      this.openApprover = true
      this.title = '审批窗口'
    },

    //审批提交数据
    submitFormApprover(){
      approverWarehouseWarrant(this.formApprover).then(response => {
        this.$modal.msgSuccess("审批操作成功");
        this.openApprover = false;
        this.getList();
      });
    },

    submitFormAudit(){
      auditWarehouseWarrant(this.formAudit).then(response => {
        this.$modal.msgSuccess("审核操作成功");
        this.openAudit = false;
        this.getList();
      });
    },


    handleAudit(row){
    this.formAudit.warehouseWarrantId = row.warehouseWarrantId
    this.openAudit = true
    this.title = "审核操作窗口"
    },

    submitFormWarehouse(){
      warehouseUpdateWarehouseWarrant(this.formWarehouse).then(response => {
        this.openWarehouse = false;
        this.$modal.msgSuccess("选择库房、货架、货位成功！");
        this.getList();
      });
    },
    //查询货位
    locationLists(){
      listLocation(null).then(response => {
        this.locationList = response.rows;

      });
    },
    //查询货架
    shelfLists(){
      listShelf(null).then(response => {
        this.shelfList = response.rows;

      });
    },
    //查询库房
    warehousesList(){
      listWarehouse(null).then(response => {
        this.warehouseList = response.rows;
      });
    },

    handleWarehouse(row){
      this.formWarehouse.warehouseWarrantId = row.warehouseWarrantId
      this.openWarehouse = true
      this.title = '选择窗口'
      this.warehousesList();
      this.shelfLists();
      this.locationLists();
    },

    /** 查询入库列表列表 */
    getList() {
      this.loading = true;
      listWarehouseWarrant(this.queryParams).then(response => {
        this.warehouseWarrantList = response.rows;
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
        warehouseWarrantId: null,
        warehouseWarrantName: null,
        warehouseWarrantNum: null,
        warehouseWarrantPrice: null,
        unit: null,
        warehouseId: null,
        shelfId: null,
        locationId: null,
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
      this.ids = selection.map(item => item.warehouseWarrantId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加入库列表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const warehouseWarrantId = row.warehouseWarrantId || this.ids
      getWarehouseWarrant(warehouseWarrantId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改入库列表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.warehouseWarrantId != null) {
            updateWarehouseWarrant(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWarehouseWarrant(this.form).then(response => {
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
      const warehouseWarrantIds = row.warehouseWarrantId || this.ids;
      this.$modal.confirm('是否确认删除入库列表编号为"' + warehouseWarrantIds + '"的数据项？').then(function() {
        return delWarehouseWarrant(warehouseWarrantIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('warehouseWarrant/warehouseWarrant/export', {
        ...this.queryParams
      }, `warehouseWarrant_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
