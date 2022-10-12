// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

// SPDX-License-Identifier: MIT

contract Battleship {
    // Players
    address payable player1;
    address payable player2;

    // CONSTANTS
    uint256 timePerMove;
    uint256 SMALL_SHIPS = 4;
    uint256 LOW_MEDIUM_SHIPS = 3;
    uint256 HIGH_MEDIUM_SHIPS = 3;
    uint256 BIG_SHIPS = 1;

    // Ships
    struct Ship {
        string name;
        uint256 size;
        bool sink;
    }

    // Players
    struct Player {
        address playerAddress;
        mapping(uint256 => Ship) ships;
    }

    // State

    // uint256 width = 10
    bool isGameOver = false;
    string currentPlayer = "user";
    bool isHorizontal = true;

    // Field
    bool[10][10] flags;

    // functions

    function createBoard(uint256 _timePerMove, address payable _player2)
        public
    {
        timePerMove = _timePerMove;
        player1 = msg.sender;
        player2 = _player2;
        emit boardCreated(msg.sender, 10, timePerMove, player1, player2);
    }

    function makeMoove(uint256 x, uint256 y) public {
        if (flags[x][y] == true) {
            setMarked(x, y);
        }
    }

    function setMarked(uint256 x, uint256 y) private {
        flags[x][y] = true;
    }

    function createGame(address payable _player2) public {
        player1 = msg.sender;
        player2 = _player2;
    }

    // modifier
    modifier restricted() {
        require(true, "This function is restricted to the contract's owner");
        _;
    }

    // Events
    event boardCreated(
        address creator,
        uint256 size,
        uint256 timePerMove,
        address player1,
        address player2
    );

    //constructor() public {}
}
