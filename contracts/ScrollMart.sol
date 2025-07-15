// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollMart
/// @notice A simple marketplace for gift-cards, loot, and mascot upgrades.
contract ScrollMart {
    address public owner;
    uint256 public nextItemId;

    struct Item {
        uint256 id;
        string name;
        uint256 price; // in wei
        bool active;
    }

    mapping(uint256 => Item) public items;
    mapping(address => uint256[]) public purchased;

    event ItemAdded(uint256 indexed id, string name, uint256 price);
    event ItemUpdated(uint256 indexed id, string name, uint256 price, bool active);
    event ItemPurchased(address indexed buyer, uint256 indexed id, uint256 price);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Add a new marketplace item.
    function addItem(string calldata name, uint256 price) external onlyOwner {
        items[nextItemId] = Item(nextItemId, name, price, true);
        emit ItemAdded(nextItemId, name, price);
        nextItemId++;
    }

    /// @notice Update an existing item’s metadata or activate/deactivate it.
    function updateItem(
        uint256 id,
        string calldata name,
        uint256 price,
        bool active
    ) external onlyOwner {
        Item storage it = items[id];
        it.name = name;
        it.price = price;
        it.active = active;
        emit ItemUpdated(id, name, price, active);
    }

    /// @notice Purchase an active item by ID.
    function buyItem(uint256 id) external payable {
        Item storage it = items[id];
        require(it.active, "Item not available");
        require(msg.value == it.price, "Incorrect payment");

        purchased[msg.sender].push(id);
        payable(owner).transfer(it.price);
        emit ItemPurchased(msg.sender, id, it.price);
    }

    /// @notice Get all item IDs a user has purchased.
    function getMyPurchases(address user) external view returns (uint256[] memory) {
        return purchased[user];
    }
}
