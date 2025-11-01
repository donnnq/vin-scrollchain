// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryShutdownReckoningLedger {
    string public batchID = "1321.9.90";
    string public steward = "Vinvin";

    struct Obstruction {
        string official;
        bool penalized;
        uint256 penaltyAmount;
    }

    mapping(string => Obstruction) public reckoningLog;

    function logObstruction(string memory official, uint256 salary) public {
        reckoningLog[official] = Obstruction(official, true, salary);
    }

    function getPenalty(string memory official) public view returns (uint256) {
        return reckoningLog[official].penaltyAmount;
    }
}
