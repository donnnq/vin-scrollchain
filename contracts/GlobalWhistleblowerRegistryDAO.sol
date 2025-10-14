// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalWhistleblowerRegistryDAO {
    address public admin;

    struct Whistleblower {
        string alias;
        string region;
        string caseLinked;
        bool protected;
    }

    Whistleblower[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerWhistleblower(string memory _alias, string memory _region, string memory _caseLinked) external onlyAdmin {
        registry.push(Whistleblower(_alias, _region, _caseLinked, true));
    }

    function getWhistleblower(uint256 index) external view returns (Whistleblower memory) {
        return registry[index];
    }
}
