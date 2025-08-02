// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinConstellationRegistry {
    struct Scroll {
        string name;
        address scrollAddress;
        string purpose;
    }

    Scroll[] public registry;

    event ScrollRegistered(string name, address scrollAddress, string purpose);

    function registerScroll(string memory name, address scrollAddress, string memory purpose) public {
        registry.push(Scroll(name, scrollAddress, purpose));
        emit ScrollRegistered(name, scrollAddress, purpose);
    }

    function getScroll(uint index) public view returns (Scroll memory) {
        return registry[index];
    }

    function totalScrolls() public view returns (uint) {
        return registry.length;
    }

    function findByName(string memory target) public view returns (address) {
        for (uint i = 0; i < registry.length; i++) {
            if (keccak256(bytes(registry[i].name)) == keccak256(bytes(target))) {
                return registry[i].scrollAddress;
            }
        }
        revert("Scroll not found");
    }
}
