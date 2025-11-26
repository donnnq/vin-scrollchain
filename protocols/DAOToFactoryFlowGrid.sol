// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFactoryFlowGrid {
    string public batchID = "1321.9.137";
    string public steward = "Vinvin";

    address public admin;

    struct FactoryFlow {
        string site; // e.g. FBIC Industrial Zone
        uint256 productionCapacity;
        uint256 employment;
        uint256 timestamp;
    }

    FactoryFlow[] public flows;

    event FactoryLogged(string site, uint256 productionCapacity, uint256 employment);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFactory(string memory site, uint256 productionCapacity, uint256 employment) public onlyAdmin {
        flows.push(FactoryFlow(site, productionCapacity, employment, block.timestamp));
        emit FactoryLogged(site, productionCapacity, employment);
    }

    function getFactory(uint256 index) public view returns (string memory site, uint256 productionCapacity, uint256 employment, uint256 timestamp) {
        FactoryFlow memory f = flows[index];
        return (f.site, f.productionCapacity, f.employment, f.timestamp);
    }
}
