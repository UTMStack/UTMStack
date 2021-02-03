package main

import (
	"github.com/rivo/tview"
)

const (
	actionPageIndex = "0"
	masterPageIndex = "1"
	probePageIndex = "2"
	uninstallPageIndex = "3"
)

func tui() {
	app := tview.NewApplication()
	pages := tview.NewPages()

	pages.AddPage(actionPageIndex, actionPage(pages, app), true, true)
	pages.AddPage(masterPageIndex, masterPage(pages, app), true, false)
	pages.AddPage(probePageIndex, probePage(pages, app), true, false)
	pages.AddPage(uninstallPageIndex, uninstallPage(pages, app), false, false)

	if err := app.SetRoot(pages, true).EnableMouse(true).Run(); err != nil {
		panic(err)
	}
}

func center(width, height int, p tview.Primitive) tview.Primitive {
	return tview.NewFlex().
		AddItem(nil, 0, 1, false).
		AddItem(tview.NewFlex().
			SetDirection(tview.FlexRow).
			AddItem(nil, 0, 1, false).
			AddItem(p, height, 1, true).
			AddItem(nil, 0, 1, false), width, 1, true).
		AddItem(nil, 0, 1, false)
}

func alert(pages *tview.Pages, message string) *tview.Pages {
	id := "alert-dialog"
	return pages.AddPage(
		id,
		tview.NewModal().
			SetText(message).
			AddButtons([]string{"Accept"}).
			SetDoneFunc(func(buttonIndex int, buttonLabel string) {
				pages.HidePage(id).RemovePage(id)
			}),
		false,
		true,
	)
}

func showResults(pages *tview.Pages, app *tview.Application, message string) *tview.Pages {
	id := "results-dialog"
	return pages.AddPage(
		id,
		tview.NewModal().
			SetText(message).
			AddButtons([]string{"Quit"}).
			SetDoneFunc(func(buttonIndex int, buttonLabel string) {
				app.Stop()
			}),
		false,
		true,
	)
}

func actionPage(pages *tview.Pages, app *tview.Application) tview.Primitive {
	list := tview.NewList().
		AddItem("Install Master", "", 'a', func() {
			pages.SwitchToPage(masterPageIndex)
		}).
		AddItem("Install Probe", "", 'b', func() {
			pages.SwitchToPage(probePageIndex)
		}).
		AddItem("Uninstall UTMStack", "", 'c', func() {
			pages.SwitchToPage(uninstallPageIndex)
		}).
		AddItem("Quit", "", 'q', func() {
			app.Stop()
		})
	list.SetBorder(true).SetTitle("UTMStack - Select operation").SetTitleAlign(tview.AlignCenter).SetBorderPadding(1, 0, 1, 0)
	return center(33, 12, list)
}

func uninstallPage(pages *tview.Pages, app *tview.Application) tview.Primitive {
	return tview.NewModal().SetText("Are you sure you want to uninstall UTMStack from your computer?").
		AddButtons([]string{"Uninstall", "Cancel"}).
		SetDoneFunc(func(buttonIndex int, buttonLabel string) {
			if buttonIndex == 0 {
				pages.AddPage(
					"uninstalling-dialog",
					tview.NewModal().SetText("Uninstalling..."),
					false,
					true,
				)
				pages.HidePage(uninstallPageIndex)
				go func(pages *tview.Pages, app *tview.Application, ) {
					uninstall()
					showResults(pages, app, "Program removed successfully.")
					app.Draw()
				}(pages, app)
			} else {
				pages.SwitchToPage(actionPageIndex)
			}
		})
}

func masterPage(pages *tview.Pages, app *tview.Application) tview.Primitive {
	form := tview.NewForm().
		AddInputField("Data directory", "", 25, nil, nil).
		AddInputField("DB password", "", 25, nil, nil).
		AddInputField("FQDN", "", 25, nil, nil).
		AddInputField("Customer Name", "", 25, nil, nil).
		AddInputField("Customer email", "", 25, nil, nil)
	form.AddButton("Back", func() {
		pages.SwitchToPage(actionPageIndex)
	}).AddButton("Install", func() {
		datadir := form.GetFormItem(0).(*tview.InputField).GetText()
		dbPass := form.GetFormItem(1).(*tview.InputField).GetText()
		fqdn := form.GetFormItem(2).(*tview.InputField).GetText()
		customerName := form.GetFormItem(3).(*tview.InputField).GetText()
		customerEmail := form.GetFormItem(4).(*tview.InputField).GetText()

		if datadir == "" || dbPass == "" || fqdn == "" || customerName == "" || customerEmail == "" {
			alert(pages, "You must provide all requested data.")
		} else {
			// TODO: installMaster()
			showResults(pages, app, "Program installed successfully.")
		}
	}).AddButton("Quit", func() {
		app.Stop()
	})
	form.SetBorder(true).SetTitle("Install Master").SetTitleAlign(tview.AlignCenter)
	return center(46, 15, form)
}

func probePage(pages *tview.Pages, app *tview.Application) tview.Primitive {
	form := tview.NewForm().
		AddInputField("Data directory", "", 25, nil, nil).
		AddPasswordField("DB password", "", 25, '*', nil).
		AddInputField("Master address", "", 25, nil, nil)
	form.AddButton("Back", func() {
		pages.SwitchToPage(actionPageIndex)
	}).AddButton("Install", func() {
		datadir := form.GetFormItem(0).(*tview.InputField).GetText()
		dbPass := form.GetFormItem(1).(*tview.InputField).GetText()
		host := form.GetFormItem(2).(*tview.InputField).GetText()

		if datadir == "" || dbPass == "" || host == "" {
			alert(pages, "You must provide all requested data.")
		} else {
			// TODO: installProbe()
			showResults(pages, app, "Program installed successfully.")
		}
	}).AddButton("Quit", func() {
		app.Stop()
	})
	form.SetBorder(true).SetTitle("Install Master").SetTitleAlign(tview.AlignCenter)
	return center(46, 15, form)
}
