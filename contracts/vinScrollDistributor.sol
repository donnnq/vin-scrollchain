// SPDX-License-Identifier: ScrollDistributor
pragma solidity ^0.8.19;

import "./vinProtocolIsolationAura.sol";

contract vinScrollDistributor {
    vinProtocolIsolationAura public isolationAura;
    address public sovereignNode;

    event SignalDispatched(string region);
    event RegionSkipped(string region);

    modifier onlySovereign() {
        require(msg.sender == sovereignNode, "Not authorized");
        _;
    }

    constructor(address _isolationAura) {
        isolationAura = vinProtocolIsolationAura(_isolationAura);
        sovereignNode = msg.sender;
    }

    function distributeToRegions(string[] calldata regions) external onlySovereign {
        for (uint256 i = 0; i < regions.length; i++) {
            if (!isolationAura.blacklistedRegions(regions[i])) {
                emit SignalDispatched(regions[i]);
                // insert actual dispatch logic here (e.g., token transfer, signal relay)
            } else {
                emit RegionSkipped(regions[i]);
            }
        }
    }
}
