// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract BlessingLedger {
    struct Blessing {
        string description;
        uint256 timestamp;
        uint256 resonanceScore;
    }

    Blessing[] public blessings;
    address public steward;

    constructor(address _steward) {
        steward = _steward;
    }

    function logBlessing(string memory _desc, uint256 _score) public {
        blessings.push(Blessing(_desc, block.timestamp, _score));
    }

    function totalResonance() public view returns (uint256 total) {
        for (uint i = 0; i < blessings.length; i++) {
            total += blessings[i].resonanceScore;
        }
    }
}
