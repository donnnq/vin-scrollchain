// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalKitchenDAO {
    address public admin;

    struct KitchenEntry {
        string country;
        string signatureDish;
        string preservationMethod;
        bool registered;
    }

    KitchenEntry[] public kitchens;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerKitchen(string memory _country, string memory _signatureDish, string memory _preservationMethod) external onlyAdmin {
        kitchens.push(KitchenEntry(_country, _signatureDish, _preservationMethod, true));
    }

    function getKitchen(uint256 index) external view returns (KitchenEntry memory) {
        return kitchens[index];
    }
}
