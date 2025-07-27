/// @title vinScrollCodex
/// @notice Registry of deployed ritual scrolls with symbolic tags, category mapping, and lore integration.
contract vinScrollCodex {
    struct Scroll {
        string name;
        string purpose;
        string category; // e.g. "Herbal", "Governance", "Aid", "Valor", "Lore"
        address deployedAt;
        string ritualSymbol; // e.g. "Leaf of Valor", "Glyph of Equity"
        bool active;
    }

    mapping(string => Scroll) public scrolls;
    string[] public scrollNames;
    event ScrollRegistered(string name, address deployedAt);
    event ScrollStatusUpdated(string name, bool active);

    /// @notice Register a new scroll
    function registerScroll(
        string calldata name,
        string calldata purpose,
        string calldata category,
        address deployedAt,
        string calldata ritualSymbol
    ) external {
        scrolls[name] = Scroll({
            name: name,
            purpose: purpose,
            category: category,
            deployedAt: deployedAt,
            ritualSymbol: ritualSymbol,
            active: true
        });
        scrollNames.push(name);
        emit ScrollRegistered(name, deployedAt);
    }

    /// @notice Deactivate or reactivate a scroll
    function updateScrollStatus(string calldata name, bool active) external {
        require(bytes(scrolls[name].name).length > 0, "Scroll not found");
        scrolls[name].active = active;
        emit ScrollStatusUpdated(name, active);
    }

    /// @notice Get all registered scroll names
    function listScrolls() external view returns (string[] memory) {
        return scrollNames;
    }
}
