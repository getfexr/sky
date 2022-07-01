package pop

import (
	"github.com/EnsurityTechnologies/logger"
)

type Oracle struct {
	log logger.Logger
}

func (oc *Oracle) SyncDataTable() {
	oc.log.Info("Syncing data table")
}