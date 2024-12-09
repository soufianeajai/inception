const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end(`
        <!DOCTYPE html>
        <html>
            <head>
                <title>My Portfolio</title>
                <style>
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 0;
                        padding: 20px;
                        background-color: #f8f9fa;
                        color: #333;
                    }
                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                    }
                    header {
                        text-align: center;
                        padding: 40px 0;
                        background-color: #fff;
                        border-radius: 10px;
                        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                        margin-bottom: 30px;
                    }
                    h1 {
                        color: #2c3e50;
                        margin: 0;
                    }
                    .projects {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 20px;
                        padding: 20px 0;
                    }
                    .project-card {
                        background: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                    }
                    .project-card h2 {
                        color: #2c3e50;
                        margin-top: 0;
                    }
                    .project-card p {
                        color: #666;
                        line-height: 1.6;
                    }
                    .skills {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 10px;
                        margin-top: 15px;
                    }
                    .skill-tag {
                        background: #e9ecef;
                        padding: 5px 10px;
                        border-radius: 15px;
                        font-size: 0.9em;
                        color: #495057;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <header>
                        <h1>Welcome to My Showcase</h1>
                        <p>Full Stack Developer</p>
                    </header>
                    
                    <div class="projects">
                <div class="project-card">
                    <h2>Inception</h2>
                    <p>A Docker-based infrastructure project featuring WordPress, MariaDB, and Nginx with SSL.</p>
                    <div class="skills">
                        <span class="skill-tag">DOCKER</span>
                        <span class="skill-tag">WORDPRESS</span>
                        <span class="skill-tag">MariaDB</span>
                    </div>
                </div>
                
                <div class="project-card">
                    <h2>Webserv</h2>
                    <p>Designed and implemented a custom HTTP/1.1 web server inspired by Nginx.</p>
                    <div class="skills">
                        <span class="skill-tag">HTTP</span>
                        <span class="skill-tag">NGINX</span>
                        <span class="skill-tag">POLLING MECHANISM</span>
                    </div>
                </div>
                
                <div class="project-card">
                    <h2>Ft_transcendence</h2>
                    <p>fullstack website where you can play pong with players.</p>
                    <div class="skills">
                        <span class="skill-tag">coming...</span>
                    </div>
                </div>
            </div>
                </div>
            </body>
        </html>
    `);
});
const PORT = 4000;
server.listen(PORT, () => {
});
