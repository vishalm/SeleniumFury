#/* Copyright (c) 2010 HomeAway, Inc.
# * All rights reserved.  http://www.homeaway.com
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */
module SeleniumFury
  module SeleniumWebDriver
    module PageValidator
      def web_driver_validate(page_class)
        missing_elements=[]
        puts "class #{page_class}"
        page_object=page_class.new(driver)
        raise "Could not find web driver elements in #{page_class}" if page_class.elements.nil?
        page_class.elements.each do |web_drive_element_name|
          puts "\tValidating #{web_drive_element_name}"
          begin
            page_object.method(web_drive_element_name).call
          rescue
            puts "\t\t\tCould not find #{web_drive_element_name}"
            missing_elements.push(web_drive_element_name)
          end
        end
        return missing_elements
      end
    end
  end
end
