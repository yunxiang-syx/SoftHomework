<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html; charset=utf-8"%>
    <title>用例点估算</title>
    <style>
        table {
            margin: 0 auto; /* 水平居中 */
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid black;
            padding: 5px;
        }

        #UAWresult,#UUCWresult,#UUCPresult,#TCFresult,#ECFresult,#UCPresult {
            text-align: center;
            color: red;
        }

        #calculateUAWBtn,#calculateUUCWBtn,#calculateUUCPBtn,#calculateTCFBtn,#calculateECFBtn,#calculateUCPBtn {
            text-align: center;
            margin-top: 20px; /* 调整距离表格的间距 */
        }
    </style>
</head>
<script>
    var UAW=0;
    var UUCW=0;
    var UUCP=0;
    var TCF=0;
    var ECF=0;
    var TEF=0;
    //计算UAW
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateUAWBtn');
        calculateBtn.addEventListener('click', function() {
            var table = document.getElementById('UAWTable'); // 使用表格的 id 选择特定的表格
            var rows = table.querySelectorAll('input');
            var sum = 0;

            rows.forEach(function(input,index) {
                var value = parseInt(input.value);
                var multipliedValue = isNaN(value) ? 0 : value*(index+1);
                sum += multipliedValue;
            });
            UAW=sum;
            var resultElement = document.getElementById('UAWresult');
            resultElement.textContent = 'UAW计算结果：' + UAW;
        });
    });
    //计算UUCW
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateUUCWBtn');
        calculateBtn.addEventListener('click', function() {
            // 获取表格
            const table = document.getElementById("UUCWTable");
            // 获取表格中的所有行
            const rows = table.getElementsByTagName("tr");
            // 初始化求和结果
            let sum = 0;
            // 从第二行开始遍历每一行（跳过表头）
            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                // 获取第三列和第四列的输入框元素
                const column3Value = parseFloat(row.cells[2].textContent);
                const column4Input = row.querySelector('input[name="value_1_4"]');
                const column4Value = parseFloat(column4Input.value);
                // 计算相乘并累加到求和结果中
                const multipliedValue = column3Value * column4Value;
                sum += multipliedValue;
            }
            console.log(sum); // 输出求和结果
            UUCW=sum;
            var resultElement = document.getElementById('UUCWresult');
            resultElement.textContent = 'UUCW计算结果：' + sum;
        });
    });
    //计算UUCP
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateUUCPBtn');
        calculateBtn.addEventListener('click', function() {
            var finalResult = UAW + UUCW;
            UUCP=finalResult;
            var resultElement = document.getElementById('UUCPresult');
            resultElement.textContent = 'UUCP计算结果：UAW + UUCW = ' + finalResult;
        });
    });
   //计算TCF
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateTCFBtn');
        calculateBtn.addEventListener('click', function() {
            var table = document.getElementById('TCFTable'); // 使用表格的 id 选择特定的表格
            var rows = table.querySelectorAll('input');
            // 获取表格中的所有行
            var rows_second = table.getElementsByTagName("tr");
            // 初始化求和结果
            let sum = 0;

            rows.forEach(function(input,index) {
                var value = parseFloat(input.value);
                var multipliedValue = isNaN(value) ? 0 : value*parseFloat(rows_second[index+1].cells[1].textContent);
                sum += multipliedValue;
            });
            console.log("sum:",sum)
            var finalResult = 0.6 + 0.01*sum;
            var resultElement = document.getElementById('TCFresult');
            TCF=finalResult;
            resultElement.textContent = 'TCF计算结果：' + finalResult;
        });
    });
    //计算ECF
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateECFBtn');
        calculateBtn.addEventListener('click', function() {
            var table = document.getElementById('ECFTable'); // 使用表格的 id 选择特定的表格
            var rows = table.querySelectorAll('input');
            // 获取表格中的所有行
            var rows_second = table.getElementsByTagName("tr");
            // 初始化求和结果
            let sum = 0;

            rows.forEach(function(input,index) {
                var value = parseFloat(input.value);
                var multipliedValue = isNaN(value) ? 0 : value*parseFloat(rows_second[index+1].cells[1].textContent);
                sum += multipliedValue;
            });
            console.log("sum:",sum)
            var finalResult = 1.4 + (-0.03)*sum;
            var resultElement = document.getElementById('ECFresult');
            finalResult = finalResult.toFixed(3);
            ECF=finalResult;
            resultElement.textContent = 'ECF计算结果：' + finalResult;
        });
    });
    //计算UCP
    window.addEventListener('DOMContentLoaded', function() {
        var calculateBtn = document.getElementById('calculateUCPBtn');
        calculateBtn.addEventListener('click', function() {
            var resultElement = document.getElementById('UCPresult');
            resultElement.textContent = 'UCP计算结果：UCP = UUCP * TCF * ECF = ' + parseInt(UUCP*TCF*ECF);
        });
    });
</script>
<body>
<h2 align="center">用例点估算</h2>


<h3 align="center">角色权值</h3>
<table id="UAWTable">
    <thead>
    <tr>
        <th>序号</th>
        <th>复杂度级别</th>
        <th>权值</th>
        <th>参与角色数</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>sample</td>
        <td>1</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>2</td>
        <td>average</td>
        <td>2</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>3</td>
        <td>complex</td>
        <td>3</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    </tbody>
</table>

<div id="calculateUAWBtn">
    <button>计算UAW</button>
</div>
<div id="UAWresult"></div>

<h3 align="center">用例权值</h3>
<table id="UUCWTable">
    <thead>
    <tr>
        <th>序号</th>
        <th>复杂度级别</th>
        <th>权值</th>
        <th>用例数</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>sample</td>
        <td>5</td>
        <td><input type="text" name="value_1_4"></td>
    </tr>
    <tr>
        <td>2</td>
        <td>average</td>
        <td>10</td>
        <td><input type="text" name="value_1_4"></td>
    </tr>
    <tr>
        <td>3</td>
        <td>complex</td>
        <td>15</td>
        <td><input type="text" name="value_1_4"></td>
    </tr>
    </tbody>
</table>

<div id="calculateUUCWBtn">
    <button>计算UUCW</button>
</div>
<div id="UUCWresult"></div>

<div id="calculateUUCPBtn">
    <button>计算UUCP</button>
</div>
<div id="UUCPresult"></div>

<h3 align="center">技术复杂度因子</h3>
<table id="TCFTable">
    <thead>
    <tr>
        <th>技术复杂度因子</th>
        <th>权值</th>
        <th>影响等级</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>TCF1</td>
        <td>2.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF2</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF3</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF4</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF5</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF6</td>
        <td>0.5</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF7</td>
        <td>0.5</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF8</td>
        <td>2.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF9</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF10</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF11</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF12</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>TCF13</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    </tbody>
</table>


<div id="calculateTCFBtn">
    <button>计算TCF</button>
</div>
<div id="TCFresult"></div>

<h3 align="center">环境复杂度因子</h3>
<table id="ECFTable">
    <thead>
    <tr>
        <th>环境复杂度因子</th>
        <th>权值</th>
        <th>影响等级</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>ECF1</td>
        <td>1.5</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF2</td>
        <td>0.5</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF3</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF4</td>
        <td>0.5</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF5</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF6</td>
        <td>2.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF7</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    <tr>
        <td>ECF8</td>
        <td>1.0</td>
        <td><input type="text" name="value_1_3"></td>
    </tr>
    </tbody>
</table>

<div id="calculateECFBtn">
    <button>计算ECF</button>
</div>
<div id="ECFresult"></div>

<div id="calculateUCPBtn">
    <button>计算用例点UCP</button>
</div>
<div id="UCPresult"></div>


</body>
</html>
