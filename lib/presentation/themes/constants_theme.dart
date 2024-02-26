import 'package:flutter/material.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

const double sizedBoxHeight = 16;
const double sizedBoxWidth = 16;

const trCartStatusColors = {
  TrStatus.approved: Colors.green,
  TrStatus.pending: Colors.orange,
  TrStatus.rejected: Colors.red,
  TrStatus.all: Colors.blue,
};

const trOrderBatchStatusColors = {
  TrOrderBatchStatus.completed: Colors.green,
  TrOrderBatchStatus.pending: Colors.orange,
  TrOrderBatchStatus.overdue: Colors.red,
  TrOrderBatchStatus.all: Colors.blue,
};

const trOrderStatusColors = {
  TrOrderStatus.approved: Colors.green,
  TrOrderStatus.pending: Colors.orange,
  TrOrderStatus.rejected: Colors.red,
  TrOrderStatus.all: Colors.blue,
};
