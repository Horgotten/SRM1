<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="成品库存名称" prop="productName">
        <el-input
          v-model="queryParams.productName"
          placeholder="请输入成品库存名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数量" prop="productNum">
        <el-input
          v-model="queryParams.productNum"
          placeholder="请输入数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="价格" prop="productPrice">
        <el-input
          v-model="queryParams.productPrice"
          placeholder="请输入价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位" prop="productUnit">
        <el-input
          v-model="queryParams.productUnit"
          placeholder="请输入单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成品入库ID" prop="operationProductId">
        <el-input
          v-model="queryParams.operationProductId"
          placeholder="请输入成品入库ID"
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
          v-hasPermi="['product:product:add']"
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
          v-hasPermi="['product:product:edit']"
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
          v-hasPermi="['product:product:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['product:product:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="productList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="productId" />
      <el-table-column label="成品库存名称" align="center" prop="productName" />
      <el-table-column label="数量" align="center" prop="productNum" />
      <el-table-column label="价格" align="center" prop="productPrice" />
      <el-table-column label="单位" align="center" prop="productUnit" />
      <el-table-column label="成品入库ID" align="center" prop="operationProductId" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['product:product:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['product:product:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleGoProduct(scope.row)"
            v-hasPermi="['product:product:goProduct']"
          >出库</el-button>

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
<!--    选择数量-->
<!--    <el-dialog :title="title" :visible.sync="openNumber" width="960px" append-to-body>
      <el-form ref="form" :model="formProduct" :rules="rules" label-width="180px">
        <el-form-item label="选择出库数量" prop="productNum">
          <el-input v-model="formProduct.productNum" type="number" placeholder="请输入出库数量" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormProduct">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>-->


    <!--    出库操作：-->
    <el-dialog :title="title" :visible.sync="openGoProduct" width="1080px" append-to-body>
      <el-form :model="queryParamsClinet" ref="queryForm" size="small" :inline="true" v-show="showSearchClient" label-width="102px">
        <el-form-item label="客户名称" prop="clientName">
          <el-input
            v-model="queryParamsClinet.clientName"
            placeholder="请输入客户名称"
            clearable
            @keyup.enter.native="clientQuery"
          />
        </el-form-item>

        <el-form-item label="联系人" prop="clientPerson">
          <el-input
            v-model="queryParamsClinet.clientPerson"
            placeholder="请输入姓名"
            clearable
            @keyup.enter.native="clientQuery"
          />
        </el-form-item>
        <el-form-item label="联系电话" prop="clientPhone">
          <el-input
            v-model="queryParamsClinet.clientPhone"
            placeholder="请输联系电话"
            clearable
            @keyup.enter.native="clientQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="clientQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetClinet">重置</el-button>
        </el-form-item>
      </el-form>
      <right-toolbar :showSearchBroker.sync="showSearchClient" @queryTable="getClientLists"></right-toolbar>

      <el-table v-loading="loading" :data="listClient" @selection-change="handleSelectionClient">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="客户ID" align="center" prop="clientId" />
        <el-table-column label="客户名称" align="center" prop="clientName" />
        <el-table-column label="客户地址" align="center" prop="clientAddress" />
        <el-table-column label="联系人" align="center" prop="clientPerson" />
        <el-table-column label="联系电话" align="center" prop="clientPhone" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleChoose(scope.row)"
              v-hasPermi="['product:product:goProduct']"
            >选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="totals>0"
        :total="totals"
        :page.sync="queryParamsClinet.pageNum"
        :limit.sync="queryParamsClinet.pageSize"
        @pagination="clientList"
      />


    </el-dialog>


    <!-- 添加或修改成品库存对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="成品库存名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入成品库存名称" />
        </el-form-item>
        <el-form-item label="数量" prop="productNum">
          <el-input v-model="form.productNum" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="价格" prop="productPrice">
          <el-input v-model="form.productPrice" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="单位" prop="productUnit">
          <el-input v-model="form.productUnit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="成品入库ID" prop="operationProductId">
          <el-input v-model="form.operationProductId" placeholder="请输入成品入库ID" />
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
import { listProduct, getProduct, delProduct, addProduct, updateProduct,goProduct } from "@/api/product/product";
import {listClient} from "@/api/client/client";

export default {
  name: "Product",
  data() {
    return {

      openNumber:false,//选择出库出量
      //接收客户
      listClient:[],
      showSearchClient:true,
      formProduct:{
        productId: null,
        productName: null,
        productPrice: null,
        productUnit: null,
        clientId:0
      },
      //传递值
      goProduct:{
        productId: null,
        productName: null,
        productNum: null,
        productPrice: null,
        productUnit: null,
        clientId:0
      },

      openGoProduct:false,//出库窗口
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
      totals:0,
      // 成品库存表格数据
      productList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      queryParamsClinet:{
        pageNum: 1,
        pageSize: 10,
        clientName: null,
        clientAddress: null,
        clientPerson: null,
        clientPhone: null,
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productName: null,
        productNum: null,
        productPrice: null,
        productUnit: null,
        operationProductId: null,
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
    //出库提交数据
    /* submitFormProduct(){
      goProduct(this.formProduct).then(response => {
        this.$modal.msgSuccess("出库操作成功");
        this.openNumber = false;
        this.openGoProduct = false
        this.getList();
      });
    },*/

    //添加数量
    handleChoose(row) {
      this.goProduct.clientId = row.clientId
      goProduct(this.goProduct).then(response => {
        this.$modal.msgSuccess("出库操作成功");
        this.openGoProduct = false
        this.getList();
      });
    }
    ,

    //按照条件查询客户
    getClientLists() {
      this.loading = true;
      listClient(this.queryParamsClinet).then(response => {
        this.listClient = response.rows;
        this.totals = response.total;
        this.loading = false;
      });
    },
    /** 重置按钮操作 */
    resetClinet() {
      this.resetForm("queryParamsClinet");
      this.clientQuery();
    },
    // 多选框选中数据
    handleSelectionClient(selection) {
      this.ids = selection.map(item => item.clientId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },

    //查询所有客户
    clientList() {
      this.loading = true;
      listClient(null).then(response => {
        this.listClient = response.rows;
        this.totals = response.total;
        this.loading = false;
      });
    },

    //出库窗体
    handleGoProduct(row) {
      this.goProduct.productId = row.productId
      this.goProduct.productName = row.productName
      this.goProduct.productPrice = row.productPrice
      this.goProduct.productNum = row.productNum
      this.goProduct.productUnit = row.productUnit
      this.openGoProduct = true
      this.title = '客户窗口'
      this.clientList()
    },

    /** 查询成品库存列表 */
    getList() {
      this.loading = true;
      listProduct(this.queryParams).then(response => {
        this.productList = response.rows;
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
        productId: null,
        productName: null,
        productNum: null,
        productPrice: null,
        productUnit: null,
        operationProductId: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    clientQuery() {
      this.queryParamsClinet.pageNum = 1;
      this.getClientLists();
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
      this.ids = selection.map(item => item.productId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加成品库存";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const productId = row.productId || this.ids
      getProduct(productId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成品库存";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.productId != null) {
            updateProduct(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProduct(this.form).then(response => {
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
      const productIds = row.productId || this.ids;
      this.$modal.confirm('是否确认删除成品库存编号为"' + productIds + '"的数据项？').then(function () {
        return delProduct(productIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('product/product/export', {
        ...this.queryParams
      }, `product_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
