/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import org.apache.ofbiz.entity.*
import org.apache.ofbiz.entity.condition.*
import org.apache.ofbiz.base.util.*



designationName = parameters.designationName;
designationTypeId = parameters.designationTypeId;
code = null;
List<EntityCondition> andExprs = new LinkedList<EntityCondition>();
			EntityCondition mainCond = null;
       if(UtilValidate.isNotEmpty(designationName)) {
					andExprs.add(EntityCondition.makeCondition(EntityFunction.UPPER_FIELD("designationName"),
						EntityOperator.LIKE, EntityFunction.UPPER("%" + designationName + "%")));
				}


				if(UtilValidate.isNotEmpty(designationTypeId)) {
					andExprs.add(EntityCondition.makeCondition("designationTypeId",
						EntityOperator.EQUALS,designationTypeId));
				}
				//andExprs.add(EntityCondition.makeCondition("statusId",
					//EntityOperator.NOT_EQUAL,"PARTY_DISABLED"));
						
				mainCond = EntityCondition.makeCondition(andExprs,
						EntityOperator.AND);

//print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+designationName);
//print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+designationTypeId);

viewIndex = parameters.VIEW_INDEX ? Integer.valueOf(parameters.VIEW_INDEX) : 0
viewSize = parameters.VIEW_SIZE ? Integer.valueOf(parameters.VIEW_SIZE) : 20

int lowIndex = viewIndex * viewSize + 1
int highIndex = (viewIndex + 1) * viewSize

context.viewIndexFirst = 0
context.viewIndex = viewIndex
context.viewIndexPrevious = viewIndex - 1
context.viewIndexNext = viewIndex + 1
context.viewSize = viewSize
context.lowIndex = lowIndex
int listSize = 0

listIt = from("designationMaster").where(mainCond).orderBy("designationId").cursorScrollInsensitive().cache(true).queryIterator()
designationMasterList = listIt.getPartialList(lowIndex, highIndex - lowIndex + 1)
//print("~~~~~~~~~~~~~~~~~designationMasterList~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+designationMasterList);

listSize = listIt.getResultsSizeAfterPartialList()
if (listSize < highIndex) {
    highIndex = listSize
}

context.viewIndexLast = (int) (listSize / viewSize)
context.highIndex = highIndex
context.listSize = listSize
listIt.close()




context.designationMasterList = designationMasterList