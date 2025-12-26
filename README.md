# Selenium E2E Test

Compact Selenium (Python) end-to-end test suite for opensource-demo.orangehrmlive.com with Allure reporting and Docker support.

Quick start
1. git clone https://github.com/OleksandrSava/Selenium_E2E_Test.git
2. cd Selenium_E2E_Test
3. python -m venv .venv && source .venv/bin/activate
4. pip install -r requirements.txt
5. pytest -q

Run with Docker
- docker-compose up --build
- or start a standalone Selenium container:
  docker run -d -p 4444:4444 --shm-size=2g selenium/standalone-chrome:latest

Useful env vars
- BASE_URL — application URL (default: https://opensource-demo.orangehrmlive.com)
- BROWSER — chrome|firefox (default: chrome)
- HEADLESS — true|false
- REMOTE_URL — remote WebDriver (optional)

Common commands
- Run all tests: pytest
- Run a folder/file: pytest tests/
- Run single test: pytest tests/test_example.py::test_login
- Parallel: pytest -n auto
- Allure report: pytest --alluredir=reports/allure

Project layout
- tests/ — test cases
- pages/ — Page Objects
- fixtures/, utils/, reports/, requirements.txt, conftest.py, docker-compose.yml

Notes
- Designed to run locally, in Docker, or in CI. Allure and JUnit artifacts are supported.
- Add LICENSE and CONTRIBUTING.md to make the repo job-ready (suggest MIT).
