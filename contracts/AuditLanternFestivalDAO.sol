// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditLanternFestivalDAO {
    address public admin;

    struct Lantern {
        string theme;
        string corridor;
        string message;
        uint256 date;
        bool released;
    }

    Lantern[] public lanterns;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function releaseLantern(string memory _theme, string memory _corridor, string memory _message, uint256 _date) external onlyAdmin {
        lanterns.push(Lantern(_theme, _corridor, _message, _date, true));
    }

    function getLantern(uint256 index) external view returns (Lantern memory) {
        return lanterns[index];
    }
}
