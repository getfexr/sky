package syncv1

import (
	"io/ioutil"
	"net/http"
	"net/url"

	"github.com/EnsurityTechnologies/logger"
)

type Rubix struct {
	log logger.Logger
}

//APIs
const (
	createDID string = "localhost:1898/create"
	initTxn   string = "localhost:1898/initiateTransaction"
	sync      string = "localhost:1898/sync"
	account   string = "localhost:1898/getAccountInfo"
)

//File Paths
// const {

// }

func (r *Rubix) Config() {

}

func CreateRubix(log logger.Logger) *Rubix {
	return &Rubix{log : log}
}

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
	resp, err := http.PostForm(createDID, url.Values{
		"data": {"Rubix"},
		"image": {"../certs/FEXR_DID.png"},


	})
	if err != nil {
		r.log.Error(err.Error())
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		r.log.Error(err.Error())
	}

	r.log.Info(string(body))
}