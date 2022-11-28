#!/usr/bin/env python3
import json
from pathlib import Path
from typing import Any, Dict, Mapping, Sequence


def post_process(
    netlist: Mapping[str, Any], config: Mapping[str, Any]
) -> Dict[str, Any]:
    if config.get("clean_ports", False):
        for m in netlist["modules"].values():
            top = m["attributes"].get("top", "0")
            if "1" in top:
                ports = m["ports"]
                for port in [
                    port
                    for port in ports.keys()
                    if port not in ("clock", "nreset")
                ]:
                    del ports[port]
    return netlist


def main(args: Sequence[str]):
    if len(args) != 4:
        print("usage: netlist-postprocessor.py in_netlist out_netlist rules")
        return 1

    # Read the netlist
    with Path(args[1]).open() as f:
        netlist = json.load(f)

    # Read the config
    try:
        with Path(args[3]).open() as f:
            config = json.load(f)
    except FileNotFoundError:
        config = {}

    netlist = post_process(netlist, config)

    # Open the output net
    with Path(args[2]).open("w") as f:
        json.dump(netlist, f, indent=4)

    return 0


if __name__ == "__main__":
    import sys

    sys.exit(main(sys.argv))
