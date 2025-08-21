// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinAPRTrendDashboard {
    struct APRTrend {
        string country;
        string partnerOrg;
        uint256[] aprHistory;
        uint256 lastUpdated;
    }

    APRTrend[] public trends;

    event APRUpdated(string country, string partnerOrg, uint256 newAPR);

    function updateAPR(
        string memory _country,
        string memory _partnerOrg,
        uint256 _newAPR
    ) public {
        bool found = false;
        for (uint i = 0; i < trends.length; i++) {
            if (
                keccak256(bytes(trends[i].country)) == keccak256(bytes(_country)) &&
                keccak256(bytes(trends[i].partnerOrg)) == keccak256(bytes(_partnerOrg))
            ) {
                trends[i].aprHistory.push(_newAPR);
                trends[i].lastUpdated = block.timestamp;
                found = true;
                break;
            }
        }

        if (!found) {
            uint256[] memory history = new uint256[](1);
            history[0] = _newAPR;
            trends.push(APRTrend({
                country: _country,
                partnerOrg: _partnerOrg,
                aprHistory: history,
                lastUpdated: block.timestamp
            }));
        }

        emit APRUpdated(_country, _partnerOrg, _newAPR);
    }

    function getAPRTrends() public view returns (APRTrend[] memory) {
        return trends;
    }
}
