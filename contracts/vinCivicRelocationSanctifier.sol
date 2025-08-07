// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCivicRelocationSanctifier {
    address public relocationArchitect;

    struct RelocationRecord {
        address beneficiary;
        string formerLocation;
        string newHomeCoordinates;
        bool homeGranted;
        uint256 timestamp;
    }

    RelocationRecord[] public relocationLog;

    event HomeGranted(address beneficiary, string newHomeCoordinates);
    event CivicSanctificationLogged(string message);

    modifier onlyArchitect() {
        require(msg.sender == relocationArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        relocationArchitect = _architect;
    }

    function grantHome(address beneficiary, string memory formerLocation, string memory newHomeCoordinates) external onlyArchitect {
        relocationLog.push(RelocationRecord(beneficiary, formerLocation, newHomeCoordinates, true, block.timestamp));
        emit HomeGranted(beneficiary, newHomeCoordinates);
    }

    function logSanctification(string memory message) external onlyArchitect {
        emit CivicSanctificationLogged(message);
    }
}
