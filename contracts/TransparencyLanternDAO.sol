// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransparencyLanternDAO {
    address public admin;

    struct Lantern {
        string theme;
        string agency;
        string message;
        uint256 date;
        bool illuminated;
    }

    Lantern[] public lanterns;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function releaseLantern(string memory _theme, string memory _agency, string memory _message, uint256 _date) external onlyAdmin {
        lanterns.push(Lantern(_theme, _agency, _message, _date, true));
    }

    function getLantern(uint256 index) external view returns (Lantern memory) {
        return lanterns[index];
    }
}
