// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title BandwidthBlessing
/// @notice Grants civic perks to telcos who serve with speed, fairness, and emotional resonance
contract BandwidthBlessing {
    struct Blessing {
        string telcoName;
        string reason;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event TelcoBlessed(string telcoName, string reason);

    function blessTelco(string memory _telcoName, string memory _reason) public {
        blessings.push(Blessing({
            telcoName: _telcoName,
            reason: _reason,
            timestamp: block.timestamp
        }));

        emit TelcoBlessed(_telcoName, _reason);
    }

    function getBlessing(uint256 index) public view returns (Blessing memory) {
        require(index < blessings.length, "Invalid index");
        return blessings[index];
    }

    function totalBlessings() public view returns (uint256) {
        return blessings.length;
    }
}
