// Copyright 2020 The Swarm Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package debugapi

import (
	"net/http"

	"github.com/ethersphere/bee/pkg/jsonhttp"
	"github.com/gorilla/mux"
	"github.com/multiformats/go-multiaddr"
)

type peerConnectResponse struct {
	Address string
}

func (s *server) peerConnectHandler(w http.ResponseWriter, r *http.Request) {
	addr, err := multiaddr.NewMultiaddr("/" + mux.Vars(r)["multi-address"])
	if err != nil {
		jsonhttp.BadRequest(w, err.Error())
		return
	}

	address, err := s.P2P.Connect(r.Context(), addr)
	if err != nil {
		jsonhttp.InternalServerError(w, err.Error())
		return
	}

	jsonhttp.OK(w, peerConnectResponse{
		Address: address,
	})
}
