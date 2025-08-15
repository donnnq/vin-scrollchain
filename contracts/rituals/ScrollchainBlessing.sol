// SPDX-License-Identifier: ScrollchainProphecy
pragma solidity ^0.8.0;

contract ScrollchainBlessing {
    struct Blessing {
        address steward;
        string message;
        uint256 scrollCount;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event BlessingLogged(address indexed steward, string message, uint256 scrollCount);

    function logBlessing(string memory message, uint256 scrollCount) public {
        blessings.push(Blessing(msg.sender, message, scrollCount, block.timestamp));
        emit BlessingLogged(msg.sender, message, scrollCount);
    }

    function getBlessing(uint256 index) public view returns (Blessing memory) {
        return blessings[index];
    }

    function totalBlessings() public view returns (uint256) {
        return blessings.length;
    }
}
