// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPackageHygieneGrid {
    string public batchID = "1321.9.220";
    string public steward = "Vinvin";

    address public admin;

    struct Package {
        string name;        // npm, PyPI, GitHub repo
        string status;      // clean, pending, compromised
        uint256 timestamp;
    }

    Package[] public packages;

    event PackageLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPackage(string memory name, string memory status) public onlyAdmin {
        packages.push(Package(name, status, block.timestamp));
        emit PackageLogged(name, status);
    }

    function getPackage(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Package memory p = packages[index];
        return (p.name, p.status, p.timestamp);
    }
}
