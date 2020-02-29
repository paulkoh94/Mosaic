import tkinter as tk
from tkinter import ttk
import tkinter.messagebox
import mysql.connector
import datetime

from random import randint

#Queries
add_personnel = """INSERT INTO Personnel(employee_id, first_name, last_name, is_employee, password, role, zip, assigned)
		VALUES(%s, %s, %s, %s, %s, %s, %s, %s)"""
add_event = """INSERT INTO Event(employee_id, street_address, city, state, zip, caller_name, urgency, date, description)
		VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
add_mission = """INSERT INTO Mission(events, personnel, status)
		VALUES(%s, %s, %s)"""

#MYSQL config
config = {
  'user': 'admin',
  'password': 'password',
  'host': 'responder1.cu7myggfct3i.us-east-1.rds.amazonaws.com',
  'database': 'Responder',
  'raise_on_warnings': True
}

states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
          "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
          "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
          "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
          "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
urgencyValues = ["1", "2", "3", "4", "5"]
employeeId = callerName = streetAddress = city = state = zipCode = description = ""
employeeRole = int
loggedBit = int
urgency = 0
dateTime = datetime.date(1950, 1, 15)

class MainMenu:
	def __init__(self, master):
		self.master = master
		self.master.title("Main Menu")
		self.master.geometry('1200x700')
		self.master.configure(bg="light blue")
		self.label = tk.Label(self.master, text="DisasterTrack", font=("Impact", 30), bg="light blue").grid(row = 0, column = 1)

		self.username = tk.StringVar()
		self.password = tk.StringVar()
		global loggedBit
		loggedBit = 0
		self.usernameLabel = tk.Label(self.master ,text = "Username:", bg="light blue").grid(row = 2,column = 0)
		self.usernameEntry = tk.Entry(self.master, width = "40",textvariable = self.username).grid(row = 2,column = 1, sticky = tk.W)


		self.passwordLabel = tk.Label(self.master, text = "Password:", bg="light blue").grid(row = 3,column = 0)
		self.passwordEntry = tk.Entry(self.master, show = "*",width = "40",textvariable = self.password).grid(row = 3,column = 1, sticky = tk.W)

		self.btn1 = tk.Button(self.master, text="Submit", command = self.ButtonMenuWindow)
		self.btn1.grid(row=20,column=0)
		self.btn2 = tk.Button(self.master, text="Create Account", command = self.CreateAccountWindow)
		self.btn2.grid(row=20,column=1)


	def ButtonMenuWindow(self):
		global loggedBit
		if(loggedBit == 1):
			return
		connect = mysql.connector.connect(**config)
		cursor = connect.cursor()
		query = "SELECT employee_id, password, role FROM Personnel WHERE employee_id = '" + self.username.get() +\
					"' AND password = '" + self.password.get() + "'"
		cursor.execute(query)
		authenticationString = cursor.fetchone()
		connect.close()

		if(authenticationString == None):
			tkinter.messagebox.showinfo("Authentication Failed", \
				"The username/password combination you entered is not in the system")
		else:
			loggedBit = 1
			global employeeId
			global employeeRole
			employeeRole = authenticationString[2]
			#print(employeeRole)
			employeeId = self.username.get()
			self.buttonMenuWindow = tk.Toplevel(self.master)
			self.app = ButtonMenuWindow(self.buttonMenuWindow)

	def CreateAccountWindow(self):
		self.createAccountWindow = tk.Toplevel(self.master)
		self.app = CreateAccountWindow(self.createAccountWindow)


class CreateAccountWindow:

	def __init__(self, master):
		self.subWindow = []
		self.master = master
		self.master.title("Create Account")
		self.master.geometry('1200x700')
		self.master.attributes("-topmost", True)
		self.master.configure(bg="light blue")
		self.label = tk.Label(self.master, text="Create New Account", font=("Arial Bold", 25), bg="light blue")\
						.grid(row = 0, column = 1)

		#Below are the variables that store the input values
		self.employeeId = ""
		self.firstName = tk.StringVar()
		self.lastName = tk.StringVar()
		self.password = tk.StringVar()
		self.status = tk.IntVar()
		self.role = tk.IntVar()
		self.zip = tk.StringVar()
		#urgency.set(1) #initialize the radio button


		self.firstNameLabel = tk.Label(self.master, text = "First Name:", bg="light blue").grid(row = 2,column = 0)
		self.firstNameEntry = tk.Entry(self.master, width = "40",textvariable = self.firstName)\
							.grid(row = 2,column = 1, sticky = tk.W)

		self.lastNameLabel = tk.Label(self.master ,text = "Last Name:", bg="light blue").grid(row = 3,column = 0)
		self.lastNameEntry = tk.Entry(self.master, width = "40", textvariable = self.lastName)\
							.grid(row = 3,column = 1, sticky = tk.W)

		self.passwordLabel = tk.Label(self.master ,text = "Password:", bg="light blue").grid(row = 4,column = 0)
		self.passwordEntry = tk.Entry(self.master, width = "40", textvariable = self.password)\
							.grid(row = 4,column = 1, sticky = tk.W)

		self.zipLabel = tk.Label(self.master ,text = "Zip:", bg="light blue").grid(row = 5,column = 0)
		self.zipEntry = tk.Entry(self.master, width = "40", textvariable = self.zip)
		self.zipEntry.grid(row = 5,column = 1, sticky = tk.W)

		self.statusLabel = tk.Label(self.master, text = "Paid Employee:    ", bg="light blue").grid(row = 6, column = 0)
		self.statusButton1 = tk.Radiobutton(self.master, text = "Yes", variable = self.status, value = 1, bg="light blue")
		self.statusButton1.grid(row = 6, column = 1, sticky = tk.W)
		self.statusButton2 = tk.Radiobutton(self.master, text = "No", variable = self.status, value = 0, bg="light blue")
		self.statusButton2.grid(row = 7, column = 1, sticky = tk.W)

		self.roleLabel = tk.Label(self.master, text = "Role:    ", bg="light blue").grid(row = 9, column = 0)
		self.roleButton1 = tk.Radiobutton(self.master, text = "Call Center Employee", variable = self.role, value = 1, bg="light blue")
		self.roleButton1.grid(row = 9, column = 1, sticky = tk.W)
		self.roleButton2 = tk.Radiobutton(self.master, text = "First Responder Chief", variable = self.role, value = 2, bg="light blue")
		self.roleButton2.grid(row = 10, column = 1, sticky = tk.W)
		self.roleButton3 = tk.Radiobutton(self.master, text = "First Responder", variable = self.role, value = 3, bg="light blue")
		self.roleButton3.grid(row = 11, column = 1, sticky = tk.W)

		self.btn = tk.Button(self.master ,text="Create Account", command = self.CreateAccount).grid(row=15,column=0)


	def CreateAccount(self):
		if len(self.zip.get()) != 5:
			self.invalidZipPopup = tk.Toplevel(self.master)
			self.subWindow.append(self.invalidZipPopup)

			self.invalidZipPopup.title("ERROR")
			self.invalidZipPopup.geometry('300x50')
			self.invalidZipPopup.attributes("-topmost", True)
			self.msg = tk.Message(self.invalidZipPopup, text="Invalid Zip Code",width=100)
			self.msg.pack()

			self.btn = tk.Button(self.invalidZipPopup,text='OK',command=self.InvalidOkBtn)
			self.btn.pack()

		else:
			firstName = self.firstName.get()
			lastName = self.lastName.get()
			self.employeeId = firstName[:1] + lastName[:1] + (''.join(["{}".format(randint(0, 9)) for num in range(0, 4)]))
			personnel_data = (self.employeeId, self.firstName.get(), self.lastName.get(), self.status.get(), self.password.get(), self.role.get(), self.zip.get(), 0)
			connect = mysql.connector.connect(**config)
			cursor = connect.cursor(buffered=True)
			operation = "SELECT * FROM Personnel WHERE employee_id = '" + self.employeeId + "'"
			cursor.execute(operation)
			if cursor.fetchone() is not None:
				self.employeeId = firstName[:1] + lastName[:1] + ''.join(["{}".format(randint(0, 9)) for num in range(0, 4)])
				operation = 'SELECT * FROM Personnel WHERE employee_id = ' + self.employeeId
				cursor.execute(operation)
			cursor.execute(add_personnel, personnel_data)
			connect.commit()
			connect.close()

			self.usernamePopup = tk.Toplevel(self.master)
			self.subWindow.append(self.usernamePopup)

			self.usernamePopup.title("USERNAME")
			self.usernamePopup.geometry('300x50')
			self.usernamePopup.attributes("-topmost", True)
			self.msg = tk.Message(self.usernamePopup, text=self.employeeId,width=100)
			self.msg.pack()

			self.btn = tk.Button(self.usernamePopup,text='OK',command=self.OkBtn)
			self.btn.pack()

	def OkBtn(self):
		self.subWindow[0].destroy()
		self.master.destroy()

	def InvalidOkBtn(self):
		self.subWindow[0].destroy()

class ButtonMenuWindow:

	def __init__(self, master):
		self.master = master
		self.master.title("Main Menu")
		self.master.geometry('1200x700')
		self.master.configure(bg="light blue")
		#self.master.attributes("-topmost", True)
		self.label = tk.Label(self.master, text="Disaster Track", font=("Arial Bold", 30), bg="light blue")\
						.grid(row = 0, column = 2)

		self.callButton = tk.Button(self.master ,text="Call Center", command = self.CallCenterWindow).grid(row=10,column=2)
		self.missionButton = tk.Button(self.master ,text="Assign Mission", command = self.CreateMissionsWindow).grid(row=12,column=2)
		self.retrieveButton = tk.Button(self.master ,text="Retrieve Mission", command = self.MissionRetrievalWindow).grid(row=14,column=2)

	def CallCenterWindow(self):
		if(employeeRole == 1) or (employeeRole == 2):
			self.callCenterWindow = tk.Toplevel(self.master)
			self.app = CallCenterWindow(self.callCenterWindow)
		else:
			tkinter.messagebox.showinfo("Authentication Failed",\
					"You are not authorized to enter this page")

	def CreateMissionsWindow(self):
		if(employeeRole == 2):
			self.missionsWindow = tk.Toplevel(self.master)
			self.app = MissionsWindow(self.missionsWindow)
		else:
			tkinter.messagebox.showinfo("Authentication Failed",\
					"You are not authorized to enter this page")

	def MissionRetrievalWindow(self):
		if(employeeRole == 2) or (employeeRole == 3):
			self.missionRetrievalWindow = tk.Toplevel(self.master)
			self.app = MissionRetrievalWindow(self.missionRetrievalWindow)
		else:
			tkinter.messagebox.showinfo("Authentication Failed",\
					"You are not authorized to enter this page")


class CallCenterWindow:

	def __init__(self, master):
		self.subWindow = []
		self.master = master
		self.master.title("Call Center")
		self.master.geometry('1200x700')
		self.master.configure(bg="light blue")
		self.master.attributes("-topmost", True)
		self.label = tk.Label(self.master, text="First Responders Call Center", font=("Arial Bold", 30), bg="light blue")\
						.grid(row = 0, column = 1)

		self.URGENCYOPTIONS = [
			("1", 1),
			("2", 2),
			("3", 3),
			("4", 4),
			("5", 5)
		]

		#Below are the variables that store the input values
		self.employeeId = tk.StringVar()
		self.callerName = tk.StringVar()
		self.streetAddress = tk.StringVar()
		self.city = tk.StringVar()
		self.state = tk.StringVar()
		self.zipCode = tk.StringVar()
		self.urgency = tk.IntVar()
		#urgency.set(1) #initialize the radio button

		self.employeeLabel = tk.Label(self.master ,text = "Employee ID:", bg="light blue")\
								.grid(row = 2,column = 0)
		self.employeeEntry = tk.Entry(self.master, width = "40",textvariable = self.employeeId)
		self.employeeEntry.insert(tk.END, employeeId)
		self.employeeEntry.grid(row = 2,column = 1, sticky = tk.W)


		self.callerLabel = tk.Label(self.master, text = "Caller Name:", bg="light blue").grid(row = 3,column = 0)
		self.callerEntry = tk.Entry(self.master, width = "40",textvariable = self.callerName)
		self.callerEntry.grid(row = 3,column = 1, sticky = tk.W)

		self.streetLabel = tk.Label(self.master ,text = "Street Address:", bg="light blue").grid(row = 4,column = 0)
		self.streetEntry = tk.Entry(self.master, width = "40", textvariable = self.streetAddress)
		self.streetEntry.grid(row = 4,column = 1, sticky = tk.W)

		self.cityLabel = tk.Label(self.master ,text = "City:", bg="light blue").grid(row = 5,column = 0)
		self.cityEntry = tk.Entry(self.master, width = "40", textvariable = self.city)
		self.cityEntry.grid(row = 5,column = 1, sticky = tk.W)

		"""
		self.stateLabel = tk.Label(self.master ,text = "State:").grid(row = 6,column = 0)
		self.stateEntry = tk.Entry(self.master, width = "40", textvariable = self.state)\
							.grid(row = 6,column = 1, sticky = tk.W)
		"""
		self.stateLabel = tk.Label(self.master ,text = "State:", bg="light blue").grid(row = 6,column = 0)
		self.stateDropdown = tk.OptionMenu(self.master, self.state, *states)\
							.grid(row = 6,column = 1, sticky = tk.W)

		self.zipLabel = tk.Label(self.master ,text = "Zip:", bg="light blue").grid(row = 7,column = 0)
		self.zipEntry = tk.Entry(self.master, width = "40", textvariable = self.zipCode)
		self.zipEntry.grid(row = 7,column = 1, sticky = tk.W)

		self.urgencyLabel = tk.Label(self.master, text = "Urgency Level:    ", bg="light blue").grid(row = 10, column = 0)
		self.urgencyButton1 = tk.Radiobutton(self.master, text = "1", variable = self.urgency, value = 1, bg="light blue")
		self.urgencyButton1.grid(row = 8, column = 1, sticky = tk.W)
		self.urgencyButton2 = tk.Radiobutton(self.master, text = "2", variable = self.urgency, value = 2, bg="light blue")
		self.urgencyButton2.grid(row = 9, column = 1, sticky = tk.W)
		self.urgencyButton2 = tk.Radiobutton(self.master, text = "3", variable = self.urgency, value = 3, bg="light blue")
		self.urgencyButton2.grid(row = 10, column = 1, sticky = tk.W)
		self.urgencyButton2 = tk.Radiobutton(self.master, text = "4", variable = self.urgency, value = 4, bg="light blue")
		self.urgencyButton2.grid(row = 11, column = 1, sticky = tk.W)
		self.urgencyButton2 = tk.Radiobutton(self.master, text = "5", variable = self.urgency, value = 5, bg="light blue")
		self.urgencyButton2.grid(row = 12, column = 1, sticky = tk.W)
		self.btn = tk.Button(self.master ,text="Submit", command = self.AddEventData).grid(row=20,column=0)

	def AddEventData(self):
		#print("Adding event data" + self.employeeId.get() + self.state.get())
		if len(self.zipCode.get()) != 5:
			self.usernamePopup = tk.Toplevel(self.master)
			self.subWindow.append(self.usernamePopup)

			self.usernamePopup.title("ERROR")
			self.usernamePopup.geometry('300x50')
			self.usernamePopup.attributes("-topmost", True)
			self.msg = tk.Message(self.usernamePopup, text="Invalid Zip Code",width=100)
			self.msg.pack()

			self.btn = tk.Button(self.usernamePopup,text='OK',command=self.OkBtn)
			self.btn.pack()

		else:
			personnel_data = (self.employeeId.get(), 'Sample', 'Employee', 1)
			dateTime = datetime.datetime.now()
			event_data = (self.employeeId.get(), self.streetAddress.get(), self.city.get(), self.state.get(), self.zipCode.get(), self.callerName.get(), self.urgency.get(), dateTime, description)
			connect = mysql.connector.connect(**config)
			cursor = connect.cursor()
			#cursor.execute(add_personnel, personnel_data) #unnecessary i think?
			cursor.execute(add_event, event_data)
			operation = 'SELECT * FROM Event'
			for result in cursor.execute(operation, multi=True):
				if result.with_rows:
					print("Rows produced by statement '{}':".format(
						result.statement))
					print(result.fetchall())
			connect.commit()
			connect.close()

			self.callerEntry.delete(0, 'end')
			self.streetEntry.delete(0, 'end')
			self.cityEntry.delete(0, 'end')
			self.zipEntry.delete(0, 'end')

	def OkBtn(self):
		self.subWindow[0].destroy()

class MissionsWindow:

	def __init__(self, master):
		self.subWindow = []
		self.master = master
		self.master.title("Create Mission")
		self.master.geometry('1200x700')
		self.master.attributes("-topmost", True)
		self.master.configure(bg="light blue")
		self.label = tk.Label(self.master, text="Create Mission", font=("Arial Bold", 25), bg="light blue")\
						.grid(row = 0, column = 1)

		self.state = tk.StringVar()
		self.zip = []

		self.stateLabel = tk.Label(self.master ,text = "State:", bg="light blue").grid(row = 1,column = 0)
		self.stateDropdown = tk.OptionMenu(self.master, self.state, *states)\
							.grid(row = 2,column = 1, sticky = tk.W)

		self.btn = tk.Button(self.master ,text="Get Missions", command = self.GetMissions).grid(row=4,column=0)

		self.connect = mysql.connector.connect(**config)
		self.cursor = self.connect.cursor()
		#print("SELECT GROUP_CONCAT(event_id), DISTINCT zip FROM Event WHERE assigned = 0 AND state = '" + self.state.get() + "' GROUP BY zip")


	def GetMissions(self):
		self.missionWindow = tk.Toplevel(self.master)
		self.subWindow.append(self.missionWindow)

		self.missionWindow.title("Select Missions")
		self.missionWindow.geometry('600x600')
		self.missionWindow.attributes("-topmost", True)
		self.missionList = tk.Listbox(self.missionWindow, selectmode = tk.SINGLE, width = 60)

		self.cursor.execute("SELECT GROUP_CONCAT(event_id), zip FROM Event WHERE assigned = 0 AND state = '" + self.state.get() + "' GROUP BY zip")

		index = 0
		for result1, result2 in self.cursor.fetchall():
			print(result1)
			self.missionList.insert('end', "MISSION " + str(index + 1) + ": ID's of Events(" + result1 + "): Mission located in zip code " + result2)
			self.zip.append(result2)
			index = index + 1
			if index is 10:
				break

		self.missionList.pack()

		btn = tk.Button(self.missionWindow,text='Submit Missions',command=self.SubmitBtn)
		btn.pack()

	def SubmitBtn(self):

		self.selectedMission = self.missionList.curselection()
		self.personnelWindow = tk.Toplevel(self.missionWindow)
		self.subWindow.append(self.personnelWindow)

		self.personnelWindow.title("Select Users")
		self.personnelWindow.geometry('600x600')
		self.personnelWindow.attributes("-topmost", True)
		self.personnelList = tk.Listbox(self.personnelWindow, selectmode = tk.MULTIPLE)

		print("SELECT employee_id FROM Personnel WHERE assigned = 0 AND zip = '" + self.zip[self.selectedMission[0]] + "'")

		self.cursor.execute("SELECT employee_id FROM Personnel WHERE assigned = 0 AND zip = '" + self.zip[self.selectedMission[0]] + "'")

		index = 0
		for result in self.cursor.fetchall():
			self.personnelList.insert('end', "USERID " + str(index + 1) + " (" + result[0] + ")")
			index = index + 1
			if index is 10:
				break

		self.personnelList.pack()

		btn = tk.Button(self.personnelWindow,text='Submit Personnel',command=self.SubmitPersonnelBtn)
		btn.pack()

	def SubmitPersonnelBtn(self):
		missionStr = self.missionList.get(self.selectedMission[:1])
		events = missionStr[missionStr.find("(")+1:missionStr.find(")")]
		selectedPersonnel = self.personnelList.curselection()
		personnelString = ""
		for personnel in selectedPersonnel:
			newPersonnelString = self.personnelList.get(personnel)
			newPersonnel = newPersonnelString[newPersonnelString.find("(")+1:newPersonnelString.find(")")]
			if personnelString == "":
				personnelString = newPersonnel
			else:
				personnelString = personnelString + "," + newPersonnel
			self.cursor.execute("UPDATE Personnel SET assigned = 1 WHERE employee_id = '" + newPersonnel + "'")

		mission_data = (events, personnelString, 1)
		self.cursor.execute(add_mission, mission_data)
		self.connect.commit()
		self.connect.close()

		self.subWindow[1].destroy()
		self.subWindow[0].destroy()

class MissionRetrievalWindow:
	def __init__(self, master):
		self.master = master
		self.master.title("Mission Retrieval")
		self.master.geometry('1200x700')
		self.master.configure(bg="light blue")
		self.master.attributes("-topmost", True)
		self.label = tk.Label(self.master, text="Mission Info", font=("Arial Bold", 30), bg="light blue")\
						.grid(row = 0, column = 0)

		global employeeId;
		print(employeeId+ '\n')

		#Retrieve the eventId varchar from mission table that contains a concatenated
		#string of all eventIds that are involved in this mission. Once the query
		#is returned, delimit by comma to create a list of the different eventIds
		connect = mysql.connector.connect(**config)
		cursor = connect.cursor()
		operation = "SELECT events, status FROM Mission WHERE personnel LIKE '%" + employeeId +"%' AND status != 0"
		cursor.execute(operation)
		missionUni = cursor.fetchone()

		#If nothing is found we will simply print a label that says that a
		#mission has not been assigned to this employee
		if(missionUni == None):
			self.noneLabel = tk.Label(self.master ,text = "A mission has not been assigned yet",\
			 							bg="light blue").grid(row = 2,column = 0)
			print("No mission is assigned to this employee")
		#Else we will extract all of the data we need to display them in a text widget
		else:
			#connect.close()
			missionString = missionUni[0]
			#print(missionString)
			#print(type(missionString))
			eventIdList = missionString.split(',')
			addressList = []
			cityList = []
			stateList = []
			callerList = []
			descriptionList = []

			#iterate through the list of eventIds and extract the event data one by one
			for i in eventIdList:
				operation = "SELECT street_address, city, state, caller_name, description FROM Event WHERE event_id = '" + i + "'"
				cursor.execute(operation)
				eventUni = cursor.fetchone()
				#print(eventUni[0] + eventUni[1] + eventUni[2] + eventUni[3] + eventUni[4])
				addressList.append(eventUni[0])
				cityList.append(eventUni[1])
				stateList.append(eventUni[2])
				callerList.append(eventUni[3])
				descriptionList.append(eventUni[4])

			#Now do the same for the personnel varchar to display the team
			operation = "SELECT mission_id, personnel, field FROM Mission WHERE personnel LIKE '%" + employeeId +"%'"
			cursor.execute(operation)
			personnelUni = cursor.fetchone()
			self.missionIdValue = personnelUni[0]
			personnelString = personnelUni[1]
			fieldString = personnelUni[2]
			self.empIdList = personnelString.split(',')
			firstNameList = []
			lastNameList = []

			for i in self.empIdList:
				operation = "SELECT first_name, last_name FROM Personnel WHERE employee_id = '" + i + "'"
				cursor.execute(operation)
				employeeUni = cursor.fetchone()
				firstNameList.append(employeeUni[0])
				lastNameList.append(employeeUni[1])

			connect.close()

			#Create the display for the events in the mission
			missionTree=ttk.Treeview(master)
			missionTree["columns"]=("one","two","three", "four", "five")
			#define the column details
			missionTree.column("#0", width=100, minwidth=270, stretch=tk.NO)
			missionTree.column("one", width=250, minwidth=150, stretch=tk.NO)
			missionTree.column("two", width=100, minwidth=200)
			missionTree.column("three", width=80, minwidth=50, stretch=tk.NO)
			missionTree.column("four", width=200, minwidth=50, stretch=tk.NO)
			missionTree.column("five", width=450, minwidth=50, stretch=tk.NO)
			#The names of the columns
			missionTree.heading("#0",text="Event Id",anchor=tk.W)
			missionTree.heading("one", text="Street",anchor=tk.W)
			missionTree.heading("two", text="City",anchor=tk.W)
			missionTree.heading("three", text="State",anchor=tk.W)
			missionTree.heading("four", text="Caller Name",anchor=tk.W)
			missionTree.heading("five", text="Description",anchor=tk.W)
			missionTree.grid(row = 3, column = 0)
			#create a loop and insert the different event info strings
			for x in range(len(eventIdList)):
				missionTree.insert("", 1, str(x), text=eventIdList[x], \
						values=(addressList[x],cityList[x],stateList[x],callerList[x],descriptionList[x]))

			#Now create a display for the employees that are in this team
			self.label = tk.Label(self.master, text="Team", font=("Arial Bold", 30), bg="light blue")\
							.grid(row = 5, column = 0)

			employeeTree=ttk.Treeview(master)
			employeeTree["columns"]=("one","two")
			#define the column details
			employeeTree.column("#0", width=200, minwidth=270, stretch=tk.NO)
			employeeTree.column("one", width=300, minwidth=150, stretch=tk.NO)
			employeeTree.column("two", width=300, minwidth=200)
			#The names of the columns
			employeeTree.heading("#0",text="Employee ID",anchor=tk.W)
			employeeTree.heading("one", text="First Name",anchor=tk.W)
			employeeTree.heading("two", text="Last Name",anchor=tk.W)
			employeeTree.grid(row = 6, column = 0)

			for x in range(len(self.empIdList)):
				employeeTree.insert("", 1, str(x), text=self.empIdList[x], \
						values=(firstNameList[x],lastNameList[x]))

			self.fieldLabel = tk.Label(self.master, text="Field Updates:", font=("Arial Bold", 30), bg="light blue")\
							.grid(row = 7, column = 0)

			self.fieldLabel = tk.Label(self.master ,text = fieldString, wraplength=500, bg="light blue")\
									.grid(row = 8,column = 0)

			self.field = tk.StringVar()
			self.fieldLabel = tk.Label(self.master ,text = "Enter field updates:", bg="light blue")\
									.grid(row = 10,column = 0)
			self.fieldEntry = tk.Entry(self.master, width = "132", textvariable = self.field)
			self.fieldEntry.grid(row = 11,column = 0, sticky = tk.W)

			self.closeButton = tk.Button(self.master, text="Submit", command = self.storeField)\
								.grid(row=12,column=0)

			self.finishButton = tk.Button(self.master, text="Finish Mission", command = self.finishMission)\
								.grid(row=13,column=0)

	def storeField(self):
		operation = ("UPDATE Mission SET field = CONCAT(field,', "+self.field.get()+"') WHERE mission_id = " + str(self.missionIdValue))
		connect = mysql.connector.connect(**config)
		cursor = connect.cursor()
		cursor.execute(operation)
		connect.commit()
		connect.close()
		self.fieldEntry.delete(0, 'end')

	def finishMission(self):
		operation = ("UPDATE Mission SET status = "+str(0)+" WHERE mission_id = '" + str(self.missionIdValue)+"'")
		connect = mysql.connector.connect(**config)
		cursor = connect.cursor()
		cursor.execute(operation)
		#loop through the list of employee list and set their assigned bit to 0
		for x in range(len(self.empIdList)):
			operation = ("UPDATE Personnel SET assigned = "+str(0)+" WHERE employee_id = '"+self.empIdList[x]+"'")
			cursor.execute(operation)
		connect.commit()
		connect.close()

def clicked():
   res = "Welcome to " + txt.get()
   lbl.configure(text= res)

	# employeeEntry.delete(0, END)
	# callerName.delete(0, END)
	# streetAddress.delete(0, END)
	# city.delete(0, END)
	# state.delete(0, END)
	# zipCode.delete(0, END)
	# urgency.delete(0, END)

def main():
	root = tk.Tk()
	mainMenu = MainMenu(root)
	root.mainloop()

if __name__== "__main__":
    main()
