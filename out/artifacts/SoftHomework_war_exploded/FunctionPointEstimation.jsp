<!DOCTYPE html>
<html>
<head>
  <%@ page contentType="text/html; charset=utf-8"%>
  <title>功能点估算</title>
  <style>
    table {
      margin: 0 auto; /* 水平居中 */
      border-collapse: collapse;
    }

    td, th {
      border: 1px solid black;
      padding: 5px;
    }

    #UFCresult,#TCFresult,#FPresult {
      text-align: center;
      color: red;
    }

    #calculateUFCBtn,#calculateTCFBtn,#calculateFPBtn {
      text-align: center;
      margin-top: 20px; /* 调整距离表格的间距 */
    }
  </style>
</head>
<script>
  var UFC=0;
  var TCF=0;
  window.addEventListener('DOMContentLoaded', function() {
    var calculateBtn = document.getElementById('calculateUFCBtn');
    calculateBtn.addEventListener('click', function() {
      var table = document.getElementById('UFCTable'); // 使用表格的 id 选择特定的表格
      var inputs = table.querySelectorAll('input');
      var multiplierArray = [3, 4, 6, 4, 5, 7, 3, 4, 6, 5, 7, 10, 7, 10, 15]; // 示例数组，可以根据需要修改

      if (inputs.length !== multiplierArray.length) {
        alert('表格行数与乘数数组长度不一致！');
        return;
      }

      var sum = 0;

      inputs.forEach(function(input, index) {
        var value = parseInt(input.value);
        var multiplier = multiplierArray[index];
        var multipliedValue = isNaN(value) ? 0 : value * multiplier;
        console.log(value+'*'+multiplier+"index:"+index)
        sum += multipliedValue;
      });

      var resultElement = document.getElementById('UFCresult');
      UFC=sum;
      resultElement.textContent = 'UFC计算结果：' + sum;
    });
  });

  window.addEventListener('DOMContentLoaded', function() {
    var calculateBtn = document.getElementById('calculateTCFBtn');
    calculateBtn.addEventListener('click', function() {
      var table = document.getElementById('TCFTable'); // 使用表格的 id 选择特定的表格
      var rows = table.querySelectorAll('input');
      var sum = 0;

      rows.forEach(function(input) {
       var value = parseInt(input.value);
       var multipliedValue = isNaN(value) ? 0 : value;
       sum += multipliedValue;
      });
      var finalResult = 0.65 + 0.01*sum;
      var resultElement = document.getElementById('TCFresult');
      TCF=finalResult;
      resultElement.textContent = 'TCF计算结果：' + finalResult;
    });
  });

  window.addEventListener('DOMContentLoaded', function() {
    var calculateBtn = document.getElementById('calculateFPBtn');
    calculateBtn.addEventListener('click', function() {
      var resultElement = document.getElementById('FPresult');
      resultElement.textContent = '功能点FP计算结果：FP = UFC * TCF = ' + Math.round(TCF*UFC);
    });122
  });
</script>
<body>
<h2 align="center">功能点估算</h2>
<h3 align="center">软件需求的功能计数项</h3>
<table id="UFCTable">
  <thead>
  <tr>
    <th></th>
    <th>简单</th>
    <th>一般</th>
    <th>复杂</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>外部输入</td>
    <td><input type="text" name="value_1_2"></td>
    <td><input type="text" name="value_1_3"></td>
    <td><input type="text" name="value_1_4"></td>
  </tr>
  <tr>
    <td>外部输出</td>
    <td><input type="text" name="value_2_2"></td>
    <td><input type="text" name="value_2_3"></td>
    <td><input type="text" name="value_2_4"></td>
  </tr>
  <tr>
    <td>外部查询</td>
    <td><input type="text" name="value_3_2"></td>
    <td><input type="text" name="value_3_3"></td>
    <td><input type="text" name="value_3_4"></td>
  </tr>
  <tr>
    <td>外部接口文件</td>
    <td><input type="text" name="value_4_2"></td>
    <td><input type="text" name="value_4_3"></td>
    <td><input type="text" name="value_4_4"></td>
  </tr>
  <tr>
    <td>内部逻辑文件</td>
    <td><input type="text" name="value_5_2"></td>
    <td><input type="text" name="value_5_3"></td>
    <td><input type="text" name="value_5_4"></td>
  </tr>
  </tbody>
</table>

<div id="calculateUFCBtn">
  <button>计算UFC</button>
</div>
<div id="UFCresult"></div>


<h3 align="center">技术复杂度因子</h3>
<table id="TCFTable">
  <thead>
  <tr>
    <th>符号</th>
    <th>通用特性</th>
    <th>调整系数</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>F1</td>
    <td>数据通信</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F2</td>
    <td>分布数据处理</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F3</td>
    <td>性能</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F4</td>
    <td>硬件负荷</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F5</td>
    <td>事务频度</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F6</td>
    <td>在线数据输入</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F7</td>
    <td>终端用户效率</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F8</td>
    <td>在线更新</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F9</td>
    <td>处理复杂度</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F10</td>
    <td>可复用性</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F11</td>
    <td>易安装性</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F12</td>
    <td>易操作性</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F13</td>
    <td>跨平台性</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  <tr>
    <td>F14</td>
    <td>可扩展性</td>
    <td><input type="text" name="value_1_3"></td>
  </tr>
  </tbody>
</table>

<div id="calculateTCFBtn">
  <button>计算TCF</button>
</div>
<div id="TCFresult"></div>

<div id="calculateFPBtn">
  <button>计算功能点FP</button>
</div>
<div id="FPresult"></div>
</body>
</html>
