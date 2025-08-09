// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmergencySanctum {
    address public scrollsmith;
    mapping(address => bool) public verifiedResponders;
    mapping(string => uint256) public crisisLedger;

    event AidDeployed(string crisis, address zone, string blessing, uint256 amount);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function verifyResponder(address agent) public onlyScrollsmith {
        verifiedResponders[agent] = true;
    }

    function logCrisis(string memory crisis, uint256 needed) public onlyScrollsmith {
        crisisLedger[crisis] += needed;
    }

    function deployAid(string memory crisis, address zone, string memory blessing) public {
        require(verifiedResponders[msg.sender], "Not a verified responder");
        uint256 amount = crisisLedger[crisis];
        require(amount > 0, "No aid available");

        crisisLedger[crisis] = 0;
        emit AidDeployed(crisis, zone, blessing, amount);
    }
}
