// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSupplyFlowGrid {
    string public batchID = "1321.9.138";
    string public steward = "Vinvin";

    address public admin;

    struct SupplyFlow {
        string material; // cacao, sugar, packaging, etc.
        string route;    // logistics path
        uint256 volume;
        uint256 timestamp;
    }

    SupplyFlow[] public flows;

    event SupplyLogged(string material, string route, uint256 volume);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSupply(string memory material, string memory route, uint256 volume) public onlyAdmin {
        flows.push(SupplyFlow(material, route, volume, block.timestamp));
        emit SupplyLogged(material, route, volume);
    }

    function getSupply(uint256 index) public view returns (string memory material, string memory route, uint256 volume, uint256 timestamp) {
        SupplyFlow memory s = flows[index];
        return (s.material, s.route, s.volume, s.timestamp);
    }
}
