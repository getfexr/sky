package syncv1

import (
	"io/ioutil"
	"net/http"

	"github.com/EnsurityTechnologies/logger"
)

type Rubix struct {
	log logger.Logger
}

//APIs
const (
	createDID string = "localhost:1898/createDID"
	initTxn   string = "localhost:1898/initiateTransaction"
	sync      string = "localhost:1898/sync"
	account   string = "localhost:1898/getAccountInfo"
)

//File Paths
// const {

// }

func (r *Rubix) Sync() {
	resp, err := http.Get(sync)
	if err != nil {
		r.log.Error(err.Error())
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		r.log.Error(err.Error())
	}

	r.log.Info(string(body))
}

func (r *Rubix) Account() {
	resp, err := http.Get(account)
	if err != nil {
		r.log.Error(err.Error())
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		r.log.Error(err.Error())
	}

	r.log.Info(string(body))
}

func (r *Rubix) Create() {
	resp, err := http.PostForm(account, nil)
	if err != nil {
		r.log.Error(err.Error())
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		r.log.Error(err.Error())
	}

	r.log.Info(string(body))
}