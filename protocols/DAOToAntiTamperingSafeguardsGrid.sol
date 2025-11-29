// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAntiTamperingSafeguardsGrid {
    string public batchID = "1321.9.198";
    string public steward = "Vinvin";

    address public admin;

    struct Safeguard {
        string package;     // shipment, container, parcel
        string measure;     // seal, sensor, audit
        uint256 timestamp;
    }

    Safeguard[] public safeguards;

    event SafeguardLogged(string package, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSafeguard(string memory package, string memory measure) public onlyAdmin {
        safeguards.push(Safeguard(package, measure, block.timestamp));
        emit SafeguardLogged(package, measure);
    }

    function getSafeguard(uint256 index) public view returns (string memory package, string memory measure, uint256 timestamp) {
        Safeguard memory s = safeguards[index];
        return (s.package, s.measure, s.timestamp);
    }
}
