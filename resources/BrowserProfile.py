from selenium import webdriver
import os

class browser_profile(object):
    @staticmethod
    def create_ff_profile(path):
        fp = webdriver.FirefoxProfile(os.path.realpath(os.path.dirname(__file__)) + os.path.sep + "selenium_profile")
        fp.set_preference('browser.download.folderList', 2)
        fp.set_preference('browser.download.dir', path)
        fp.update_preferences()
        return fp.path

    @staticmethod
    def create_chrome_options(path):
        prefs = {
            'prompt_for_download': False,
            'download.default_directory': path,
            'download.directory_update': True,
            "printing.enabled": False
        }
            
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_experimental_option('prefs', prefs)
        chrome_options.add_argument("--disable-print-preview")
        chrome_options.add_argument("--ignore-certificate-errors")
        chrome_options.add_argument("--ignore-ssl-errors")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--no-sandbox")
        # chrome_options.add_argument("--headless") # Run without open browser
        return chrome_options
