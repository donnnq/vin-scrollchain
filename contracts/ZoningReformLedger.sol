// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZoningReformLedger {
    address public admin;

    struct Reform {
        string city;
        bool mixedUseEnabled;
        bool densityIncreased;
        bool approved;
    }

    Reform[] public reforms;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReform(string memory _city, bool _mixedUse, bool _density) external onlyAdmin {
        reforms.push(Reform(_city, _mixedUse, _density, true));
    }

    function getReform(uint256 index) external view returns (Reform memory) {
        return reforms[index];
    }
}
