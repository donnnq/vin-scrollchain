// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinRitualEcho {
    struct Echo {
        string ritualName;
        string description;
        uint256 timestamp;
    }

    Echo[] public echoes;

    event RitualEchoed(string ritualName, string description, uint256 timestamp);

    function recordRitual(string memory name, string memory desc) public {
        echoes.push(Echo(name, desc, block.timestamp));
        emit RitualEchoed(name, desc, block.timestamp);
    }

    function getEcho(uint index) public view returns (Echo memory) {
        return echoes[index];
    }

    function totalEchoes() public view returns (uint) {
        return echoes.length;
    }
}
