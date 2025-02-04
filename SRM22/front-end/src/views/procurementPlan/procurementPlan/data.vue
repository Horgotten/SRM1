<template>
  <div class="app-container">
    <el-descriptions
      class="margin-top"
      title="采购计划详情"
      direction="vertical"
      :column="4"
      border
    >
      <el-descriptions-item label="采购计划名称">{{
        procurementPlan.procurementPlanName
      }}</el-descriptions-item>
      <el-descriptions-item label="采购计划数量">{{
        procurementPlan.procurementPlanNum
      }}</el-descriptions-item>
      <el-descriptions-item label="采购计划价格" :span="2">{{
        procurementPlan.procurementPlanPrice
      }}</el-descriptions-item>

      <el-descriptions-item label="单位">
        <el-tag size="small">单位</el-tag>
        {{ procurementPlan.unit }}
      </el-descriptions-item>
    </el-descriptions>
  </div>
</template>

<script>
import { getProcurementPlan } from "../../../api/procurementPlan/procurementPlan";
export default {
  name: "data",
  data() {
    return {
      procurementPlan: {},
    };
  },
  created() {
    const procurementPlanId =
      this.$route.params && this.$route.params.procurementPlanId;
    this.getData(procurementPlanId);
  },
  methods: {
    getData(procurementPlanId) {
      getProcurementPlan(procurementPlanId).then((response) => {
        // console.log("游客数据",response)
        this.procurementPlan = response.data;
      });
    },
  },
};
</script>

<style scoped>
</style>
