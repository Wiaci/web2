<%@ page import="history.Note" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Strange Thing</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <h1 id="head">Прозоров Вячеслав, P3231, вар. 2736</h1>
</header>

<%
    if (session.getAttribute("history") == null) {
        session.setAttribute("history", new ArrayList<>());
    }
%>

<div id="wrapper">
    <div id="left">
        <div id="graph">
            <svg width="300" height="300" xmlns="http://www.w3.org/2000/svg">
                <polygon points="150,0 144,15 156,15" stroke="black"></polygon>
                <polygon points="300,150 285,156 285,144" stroke="black"></polygon>

                <polygon points="150,150 200,150 200,250 150,250" fill="#c10416"></polygon>
                <path class="svg-figure circle-figure" d="M 100 150 A 50 50, 90, 0, 0, 150 200 L 150 150 Z"
                      fill="#c10416"></path>
                <polygon points="150,150 50,150 150,50" fill="#c10416"></polygon>

                <line class="axis" x1="0" x2="300" y1="150" y2="150" stroke="black"></line>
                <line class="axis" x1="150" x2="150" y1="0" y2="300" stroke="black"></line>

                <line class="coor-line" x1="200" x2="200" y1="155" y2="145" stroke="black"></line>
                <line class="coor-line" x1="250" x2="250" y1="155" y2="145" stroke="black"></line>

                <line class="coor-line" x1="50" x2="50" y1="155" y2="145" stroke="black"></line>
                <line class="coor-line" x1="100" x2="100" y1="155" y2="145" stroke="black"></line>

                <line class="coor-line" x1="145" x2="155" y1="100" y2="100" stroke="black"></line>
                <line class="coor-line" x1="145" x2="155" y1="50" y2="50" stroke="black"></line>

                <line class="coor-line" x1="145" x2="155" y1="200" y2="200" stroke="black"></line>
                <line class="coor-line" x1="145" x2="155" y1="250" y2="250" stroke="black"></line>

                <text class="coor-text" x="195" y="140">R/2</text>
                <text class="coor-text" x="248" y="140">R</text>

                <text class="coor-text" x="40" y="140">-R</text>
                <text class="coor-text" x="90" y="140">-R/2</text>

                <text class="coor-text" x="160" y="105">R/2</text>
                <text class="coor-text" x="160" y="55">R</text>

                <text class="coor-text" x="160" y="205">-R/2</text>
                <text class="coor-text" x="160" y="255">-R</text>

                <%
                    ArrayList<?> h = (ArrayList<?>) session.getAttribute("history");
                    for (int i = 0; i < h.size(); i++) {
                        Note note = (Note) h.get(i);
                %>
                <circle cx="<%=150+note.getX()/note.getR()*100%>" cy="<%=150-note.getY()/note.getR()*100%>" r="4"
                        fill="orange"></circle>
                    <%}%>

            </svg>
        </div>

        <div id="form">
            <form action="node" method="post">
                <div class="fDiv">
                    X :
                    <input type="radio" name="x-vals" value="-3" checked> -3
                    <input type="radio" name="x-vals" value="-2"> -2
                    <input type="radio" name="x-vals" value="-1"> -1
                    <input type="radio" name="x-vals" value="0"> 0
                    <input type="radio" name="x-vals" value="1"> 1
                    <input type="radio" name="x-vals" value="2"> 2
                    <input type="radio" name="x-vals" value="3"> 3
                    <input type="radio" name="x-vals" value="4"> 4
                    <input type="radio" name="x-vals" value="5"> 5
                </div>

                <div class="fDiv">
                    Y <!--(-5...3) -->:
                    <input type="text" id="y" placeholder="От -5 до 3"> <span id="incorrect"></span>
                </div>

                <div class="fDiv">
                    R :
                    <input type="radio" name="r-vals" value="1" checked> 1
                    <input type="radio" name="r-vals" value="1.5"> 1.5
                    <input type="radio" name="r-vals" value="2"> 2
                    <input type="radio" name="r-vals" value="2.5"> 2.5
                    <input type="radio" name="r-vals" value="3"> 3 <br>
                </div>
            </form>
        </div>

    </div>

    <div id="table">
        <table id="results">
            <tr id="header">
                <td>X</td>
                <td>Y</td>
                <td>R</td>
                <td>Попадание</td>
                <td>Тек. время</td>
                <td>Время исполнения</td>
            </tr>
            <%
                if (request.getParameter("delete") != null && request.getParameter("delete").equals("true")) {
                    session.setAttribute("history", new ArrayList<>());
                }
                for (int i = 0; i < h.size(); i++) {
                    Note note = (Note) h.get(i);
                %>

            <tr>
                <td><%= (int) note.getX() %></td>
                <td><%= note.getY() %></td>
                <td><%= note.getR() %></td>
                <td><%= note.getAnswer() %></td>
                <td><%= note.getDate() %></td>
                <td><%= note.getTime() %></td>
            </tr>
            <%}%>
    </div>

    <div id="clear_wrapper">
        <button id="clear" disabled>ОЧИСТИТЬ</button>
        <div id="clickable"></div>
    </div>
</div>




<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
<script type="text/javascript" src="script.js"></script>
</body>
</html>
