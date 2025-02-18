require 'gosu'

# Class that handles the rendering window
class Cube3D < Gosu::Window
  def initialize
    super(800, 600, false) # Window size 🖥️
    self.caption = "3D Cube with Gosu" # Window title 🎮

    # Defining the cube vertices (in 3D, x, y, z) 🔲
    @vertices = [
      [-1, -1, -1], [ 1, -1, -1], [ 1,  1, -1], [-1,  1, -1], # Front face
      [-1, -1,  1], [ 1, -1,  1], [ 1,  1,  1], [-1,  1,  1]  # Back face
    ]

    # The edges connecting the vertices of the cube 🔗
    @edges = [
      [0, 1], [1, 2], [2, 3], [3, 0], # Front face
      [4, 5], [5, 6], [6, 7], [7, 4], # Back face
      [0, 4], [1, 5], [2, 6], [3, 7]  # Connecting front and back
    ]

    @angle = 0 # Rotation angle 🔄
    @scale = 100 # Scale factor to enlarge the cube 🔍
  end

  # Update method (runs every frame) 🔄
  def update
    @angle += 0.02 # Increase the angle each update (rotates the cube) 🔄
  end

  # Draw method (renders the objects on screen) 🖌️
  def draw
    # Rotate and draw the edges of the cube 🔳
    @edges.each do |edge|
      point1 = @vertices[edge[0]]
      point2 = @vertices[edge[1]]

      # Apply rotation directly to the points 🔄
      rotated_point1 = rotate(point1, @angle)
      rotated_point2 = rotate(point2, @angle)

      # Apply the scaling factor 🔍
      rotated_point1 = scale(rotated_point1)
      rotated_point2 = scale(rotated_point2)

      # Draw the line between the rotated and scaled points ✏️
      draw_line(rotated_point1[0] + 400, rotated_point1[1] + 300, Gosu::Color::WHITE,
                rotated_point2[0] + 400, rotated_point2[1] + 300, Gosu::Color::WHITE)
    end
  end

  # Function to rotate a point in 3D around the Z-axis 🔄
  def rotate(point, angle)
    x, y, z = point
    cos_angle = Math.cos(angle)
    sin_angle = Math.sin(angle)
    
    # Rotation matrix in the XY plane (around the Z-axis) 🔄
    [
      cos_angle * x - sin_angle * y,
      sin_angle * x + cos_angle * y,
      z
    ]
  end

  # Function to apply scaling to the points 🔍
  def scale(point)
    x, y, z = point
    [
      x * @scale,
      y * @scale,
      z * @scale
    ]
  end
end

# Create and show the window 🖥️
Cube3D.new.show
