<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="Css/adminStyle.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }
        
.sidebar {
    width: 200px;
    background: #1e1e2d;
    color: white;
    height: 100vh;
    padding: 20px;
    position: fixed;
    display: flex;
    flex-direction: column;
    transition: width 0.3s ease-in-out;
}

.sidebar h2 {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
}

.sidebar a {
    color: white;
    display: flex;
    align-items: center;
    padding: 12px;
    text-decoration: none;
    margin: 8px 0;
    border-radius: 5px;
    transition: all 0.3s ease;
    font-size: 16px;
}

.sidebar a i {
    margin-right: 10px;
    font-size: 18px;
}

.sidebar a:hover {
    background: #007bff;
    padding-left: 20px;
    transition: all 0.3s ease;
}

.sidebar a.active {
    background: #007bff;
    font-weight: bold;
    padding-left: 20px;
}

/* Sidebar Hover Effect - Expand */
.sidebar:hover {
    width: 260px;
}

/* Logout Button */
.logout-btn {
    margin-top: auto;
    background: red;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
}

.logout-btn:hover {
    background: darkred;
}

/* Content Area */
.content {
    margin-left: 270px;
    padding: 20px;
    width: calc(100% - 270px);
}

        .dashboard-cards {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            text-align: center;
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 18px;
            color: #444;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }

        .card span {
            font-size: 14px;
        }

        /* Table Styling */
        .status-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
        }

        .status-table th, .status-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .status-table th {
            background: #007bff;
            color: white;
            font-weight: bold;
        }

        .status-table tr:hover {
            background-color: #f1f1f1;
        }

        /* Chart Container */
        .chart-container {
            margin-top: 20px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <h2>🚗 Car Rent</h2>
    <a href="adminDashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="manageAdmins.jsp"><i class="fas fa-user-shield"></i> Manage Admins</a>
    <a href="manageDrivers.jsp"><i class="fas fa-car"></i> Manage Drivers</a>
    <a href="manageCars.jsp"><i class="fas fa-car-side"></i> Manage Cars</a>
    <a href="admin_bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
    <a href="AdminContact.jsp"><i class="fas fa-file-invoice-dollar"></i> Message Box</a>
    <a href="reports.jsp"><i class="fas fa-chart-line"></i> Reports</a>
    <a href="${pageContext.request.contextPath}/AdminLogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>


    <div class="content">
        <h2>Welcome, <%= session.getAttribute("adminUser") %>!</h2>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <h3>Income</h3>
                <p>$9460.00</p>
                <span style="color: red;">↓ 1.5%</span>
            </div>
            <div class="card">
                <h3>Expenses</h3>
                <p>$5660.00</p>
                <span style="color: green;">↑ 2.5%</span>
            </div>
            <div class="card">
                <h3>Bookings</h3>
                <p>54%</p>
                <span style="color: blue;">Total Hired</span>
            </div>
        </div>

        <!-- Car Status Table -->
        <h3>Live Car Status</h3>
        <table class="status-table">
            <tr>
                <th>No.</th>
                <th>Car No.</th>
                <th>Driver</th>
                <th>Status</th>
                <th>Earnings</th>
            </tr>
            <tr>
                <td>01</td>
                <td>6465</td>
                <td>Alex Noman</td>
                <td style="color: green;">Completed</td>
                <td>$35.44</td>
            </tr>
            <tr>
                <td>02</td>
                <td>5665</td>
                <td>Razib Rahman</td>
                <td style="color: blue;">Pending</td>
                <td>$0.00</td>
            </tr>
            <tr>
                <td>03</td>
                <td>1755</td>
                <td>Luke Norton</td>
                <td style="color: orange;">In Route</td>
                <td>$23.50</td>
            </tr>
        </table>

        <!-- Earnings Chart -->
        <div class="chart-container">
            <h3>Earnings Summary</h3>
            <canvas id="earningsChart"></canvas>
        </div>
    </div>

    <script>
        var ctx = document.getElementById("earningsChart").getContext("2d");
        var earningsChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: ["May", "Jun", "Jul", "Aug", "Sep", "Oct"],
                datasets: [{
                    label: "Last 6 months",
                    data: [100000, 150000, 130000, 180000, 200000, 230000],
                    borderColor: "#007bff",
                    backgroundColor: "rgba(0, 123, 255, 0.1)",
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: "#333"
                        }
                    }
                },
                scales: {
                    x: {
                        grid: {
                            display: false
                        }
                    },
                    y: {
                        grid: {
                            color: "#ddd"
                        },
                        ticks: {
                            callback: function(value) {
                                return '$' + value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
