// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTCollection is ERC721A, Ownable {
    uint256 public constant MAX_SUPPLY = 10000;
    uint256 public constant MINT_PRICE = 0.05 ether;
    uint256 public constant MAX_MINT_PER_TX = 5;

    string private baseTokenURI;

    constructor() ERC721A("GhostApe", "GAPE") Ownable(msg.sender) {}

    function mint(uint256 quantity) external payable {
        require(totalSupply() + quantity <= MAX_SUPPLY, "Max supply exceeded");
        require(quantity <= MAX_MINT_PER_TX, "Exceeds max mint per tx");
        require(msg.value >= quantity * MINT_PRICE, "Insufficient funds");

        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        baseTokenURI = _newBaseURI;
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }
}
